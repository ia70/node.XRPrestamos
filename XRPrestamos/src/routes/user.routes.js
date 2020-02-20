'use strict';
const express = require('express');
const router = express.Router();

const pool = require('../database');

router.get('/', async (req, res) => {
    const usuarios = await pool.query('SELECT * FROM usuario');
    res.json({ usuarios });
});

module.exports = router;