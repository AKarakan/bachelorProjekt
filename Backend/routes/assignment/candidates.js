const mysql = require("mysql");
const express = require("express");
const candidates = express.Router({mergeParams: true}); 
candidates.use(express.json());

let con = mysql.createConnection({
    host: "localhost",
    user: "Node_app",
    password: "TestPass123",
    database: "mydb"
});


con.connect((err)=> {
    if (err) throw err;
    console.log("candidates.js connected to mysql");
});



candidates.get('/:radKM', (req,res,next)=>{

    let candidatesQuery = `call getCandidates(${req.params.id},${req.params.radKM})`
    con.query(candidatesQuery, (err, candidateResult)=>{
        if (err) throw err;
        // implementiere ranking system über assignment und tester Asys JSON
        // Mehr überlappung beider listen => mehr Punkte => höher im ranking 
        console.log(candidateResult[0])

        let assignmentQuery = `select Json_extract(AssistenceSystems,'$.Asys') as Asys from assignment where assignmentID = ${req.params.id};`
        con.query(assignmentQuery,(err,result)=>{
            if (err) throw err;

            console.log(result)
            let assignmentAsys = JSON.parse(result[0].Asys)
            for( let x = 0; x < candidateResult[0].length; x++)
            {
                console.log("-----------------");
                let candidatesAsys = JSON.parse(candidateResult[0][x].tAsys).Asys;
                // ein "hit": wenn beide arrays den selben wert beinhalten.
                let hits = assignmentAsys.filter(elem => candidatesAsys.includes(elem)).length;
                candidateResult[0][x].hits = hits;
                console.log(candidateResult[0][x]);

            }
            candidateResult[0].sort((a,b)=> b.hits-a.hits);
            res.status(200).send({"candidaten":candidateResult[0], "Asys": assignmentAsys});
        })
    })
})



module.exports = candidates;