const mongoose = require('mongoose');
mongoose.Promise = global.Promise;


const ScoreSchema = new mongoose.Schema({

    // _id: mongoose.Schema.Types.ObjectId,
    cb_score:{
        type:Number,
        require: true,
    },
    scoreList:[
        {cb_score: Number},
    ]
});
module.exports = mongoose.model('score',ScoreSchema);