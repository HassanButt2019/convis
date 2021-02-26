
const logger = require('morgan');
const express = require('express');
const bodyParser = require('body-parser');
const score = require('./server/routes/score');
const MongoClient = require('mongodb').MongoClient
const app = express();
const mongoose = require('mongoose');

var connectionString = 'mongodb+srv://hassanbutt:helloworld123@cluster0.mqd9c.mongodb.net/trivia?retryWrites=true&w=majority';





app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}))
app.use(logger('dev'));
app.use('',score);

//set up mongoDb
mongoose.connect(connectionString,{
  useNewUrlParser: true,
  useCreateIndex:true,
  useFindAndModify:false,
  useUnifiedTopology:true
  });
  console.log(`Mongo Db Connected:`);
// mongodb end

  // const db = client.db('test')
  // app.get('/',async (req , res)=>{
  //   res.send('Hello World')
  //   console.log('Hellooooooooooooooooo!')
  // });
  // app.get('/score',async (req , res)=>{ 
  // try{
  //         const score = await db.collection('beep').findOne()
  //         console.log(score);
  //         res.status(200).json({ success: true, data: score });

  //     }catch(err)
  //     {
  //         res.status(400).json({ success: false  , msg:err});
  //     }
  // })


const port = 3000;

app.get('/' , (req,res)=>{
  res.status(200).json({
    message:"welcome To The Trivia"
  });
});





  app.listen(port,()=>{
    console.log('listening on 3000')
  })








console.log("may node be with you")