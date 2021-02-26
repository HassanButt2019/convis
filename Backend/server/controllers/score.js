const mongoose = require('mongoose');
const Score = require('../models/score');


//create Collision Bounding Score
exports.createCBSCore = async(req , res) => {
    console.log(req.body);
    try{
        
        const score = await new Score(req.body);
            
// add for list of Scores          
        await score.save();
     
        if (!score) {
            return res.status(400).json({ success: false });
          }
          return res.status(200).json({ success: true, msg: score });
        
    }catch(err)
    {
        return res.status(400).json({ success: false, msg: err });
    }

 
}