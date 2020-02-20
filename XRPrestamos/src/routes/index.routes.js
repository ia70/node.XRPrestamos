'use strict';
const express = require('express');
const router = express.Router();

router.get('/api', (req, res) => {
    res.json({
        status: 'API Works'
    });
});

module.exports = router;