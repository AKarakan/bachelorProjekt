let express = require('express');
let app = express();
let cors = require('cors');



let port = process.env.PORT || 3000;

app.listen(port, function(){
    console.log('App running on port: ' +port);
});

app.use(cors());

//route to client
let client = require('./client/client')
app.use('/client', client);

//route to tester
let tester =require('./tester/tester')
app.use('/tester', tester);

//route to assignment
let assignment = require('./assignment/assignment')
app.use('/assignment', assignment);

app.get('/', function(req,res)
{
    res.send("Main Page");
});
