const mysql = require("mysql");
const express = require("express");
const assignment = express.Router({mergeParams: true}); 
const NodeGeoCoder = require("node-geocoder");
const geoCoder = NodeGeoCoder({provider: "openstreetmap"});

assignment.use(express.json());

let con = mysql.createConnection({
    host: "localhost",
    user: "Node_app",
    password: "TestPass123",
    database: "mydb",

});

con.connect((err)=> {
    if (err){
        throw err;
    } 
    else
    {
        console.log("assignment.js connected to mysql");
    }
});

assignment.get('/', (req,res,next)=>{
    con.query("SELECT * FROM assignment", (err, result) => {
        if (err){
            res.send(err);
        }{
            //console.log(result);
            console.log("assignment get success")
            res.send(result)
        }
    });
})

let candidates = require('./candidates');
assignment.use('/:id/candidates',candidates);


assignment.get('/:id', (req,res,next)=>{
    let query = `
    select AssignmentID, ClientFK, clientID from assignment
    join client
    on clientFK = clientID
    where clientID = ${req.params.id};`
    con.query(query, (err, result) => {
        if (err) {
            res.send(err)
        }
        else {
            //console.log(result);
            console.log("assignment get success")
            res.send(result);
        }
    });
})

assignment.post('/', (req,res,next)=>{

    console.log(req.body);

    getGeoCoordinaten(req.body.Site_Adress, req.body.Site_ZipCode)
    .then(
        (data)=>{
            if (typeof data == 'undefined' || data.length == 0) {
                res.send("adresse falsch")
                return
            }
            else
            {   
                let aktReqNeeds = req.body.RequiredNeeds;
                aktReqNeeds = aktReqNeeds.replace(" ","");
                aktReqNeeds = aktReqNeeds.split(",");
                let query = `insert into assignment values(null,\
                    '${req.body.ClientFk}',\
                    '${req.body.Title}',\
                    '${req.body.Description}',\
                    '${req.body.Site}',\
                    '${req.body.Site_ZipCode}',\
                    '${req.body.Site_Adress}',\
                    '${req.body.HourlyRate}',\
                    '${req.body.TimeRequired}',\
                    '{"Asys":${JSON.stringify(req.body.AssistenceSystems)}}',\ 
                    '{"ReqNeeds":${JSON.stringify(aktReqNeeds)}}',\
                    'Active',\
                    NOW(),\
                    ADDDATE(NOW(),7),\
                    ADDDATE(NOW(),30),\
                    ADDDATE(NOW(),35),\
                    ST_GeomFromText('POINT(${data[0].latitude} ${data[0].longitude})'));` 
                    console.log(query);
                con.query(query, (err) => {
                    if (err) 
                    {
                        console.log(err);
                        res.status(500).send(err)
                    }
                    else
                    {
                        res.status(200).send("eintrag erfolgreich in assignment eingefügt")
                    }
                })
            }
        },
        (err)=>{
            console.log(err)
            res.send(err);
        }
    )
})

async function getGeoCoordinaten(adresse, zipCode){
    try{

        return await geoCoder.geocode(adresse+ " " +zipCode)
    }
    catch(err){
        return err;
    }

}

module.exports = assignment;