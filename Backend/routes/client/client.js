const mysql = require('mysql');
const express = require("express");
const client = express.Router({mergeParams: true}); 


client.use(express.json())

let con = mysql.createConnection({
  host: "localhost",
  user: "Node_app",
  password: "TestPass123",
  database: "mydb"
});

con.connect((err)=> {
    if (err) throw err;
    console.log("client.js connected to mysql");
});

client.get('/', (req, res, next)=>{
    con.query("SELECT * FROM client", (err, result) => {
        if (err) throw err;
        //console.log(result);
        console.log("client get success")
        res.send(result)
    });
});

client.post('/', (req, res, next) =>{
    let result = Object.keys(req.body).map((key) => "\""+req.body[key]+"\"");
    console.log(result);
    con.query("INSERT INTO client VALUES(null," + result.toString()+")",(err)=>{
        if (err) res.status(500).send(err)
        console.log("eine weitere zeile erfolgreich hinzugefügt");
    });
    let message = "eine weitere zeile erfolgreich hinzugefügt" + result.toString()
    res.status(200).send(message)
});


module.exports = client