const mysql = require('mysql');
const express = require("express");
const tester = express.Router({mergeParams: true});
const NodeGeoCoder = require("node-geocoder");
const geoCoder = NodeGeoCoder({provider: "openstreetmap"})


tester.use(express.json())

let con = mysql.createConnection({
  host: "localhost",
  user: "Node_app",
  password: "TestPass123",
  database: "mydb"
});

con.connect((err)=> {
    if (err) throw err;
    console.log("tester.js connected to mysql");
});

tester.get('/', (req, res, next)=>{
    con.query("SELECT * FROM tester", (err, result) => {
        if (err) throw err;
        console.log(result);
        console.log("tester get")
        res.send(result)
    });
});

tester.post('/', (req, res, next) =>{
    getGeoCoordinaten(req.body.Adress, req.body.ZIPCode)
    .then(
        (data)=>{
            if (typeof data == 'undefined' || data.length == 0) {
                res.status(500).send("adresse falsch")
                return
            }
            else {
                let aktNeeds = req.body.Needs;
                aktNeeds = aktNeeds.replace(" ","");
                aktNeeds = aktNeeds.split(",");
                let query =  `INSERT INTO Tester VALUES(null,\
                    '${req.body.Name}',\
                    '${req.body.SurName}',\
                    '${req.body.Password}',\
                    '${req.body.ZIPCode}',\
                    '${req.body.Adress}',\
                    '${req.body.Email}',\
                    '${req.body.PhoneNumber}',\
                    '${req.body.ProfilePicture}',\
                    '{"Needs": ${JSON.stringify(aktNeeds)}}',\
                    '{"Asys": ${JSON.stringify(req.body.Asys)}}',\
                    '${req.body.WorkingSite}',\
                    ST_GeomFromText('POINT(${data[0].latitude} ${data[0].longitude})'));`
                console.log(query);
                con.query( query,(err)=>{
                if (err) 
                {
                    console.log(err)
                    res.status(500).send(err)
                }
                else
                {
                    let message = "eine weitere zeile erfolgreich hinzugefügt"
                    res.status(200).send(message)
                }
            });
            }
        },
        (err)=>{
            res.status(500).send("adresse falsch"+ err)
        }
    )
});

async function getGeoCoordinaten(adresse, zipCode){
    try{

        return await geoCoder.geocode(adresse+ " " +zipCode)
    }
    catch(err){
        return err;
    }
}

module.exports = tester;