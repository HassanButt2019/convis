const express = require('express');
const { createCBSCore} = require('../controllers/score');


const router = express.Router();

router.post('/score',createCBSCore);

module.exports = router
