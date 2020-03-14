const pool = require('../database');
const error = require('../config');

const tabla = "abono";
const primary_key = "id_abono";



async function insertar(objeto) {
    try {
        const data = await pool.query('INSERT INTO ' + tabla + ' SET ?', [objeto]);
        return data;
    } catch (e) {
        if (error.mostrar)
            console.log(e);
        return null;
    }
}

async function editar(objeto) {
    try {
        const data = await pool.query('UPDATE ' + tabla + ' SET ? WHERE ' + primary_key + ' = ?', [objeto, objeto[primary_key]]);
        return data;
    } catch (e) {
        if (error.mostrar)
            console.log(e);
        return null;
    }
}

async function eliminar(objeto) {
    try {
        const data = await pool.query('DELETE FROM ' + tabla + ' WHERE ' + primary_key + ' = ?', [objeto[primary_key]]);
        return data;
    } catch (e) {
        if (error.mostrar)
            console.log(e);
        return null;
    }
}

async function consulta(objeto) {
    try {
        const data = await pool.query('SELECT * FROM ' + tabla + ' WHERE ' + primary_key + '=?', [objeto[primary_key]]);
        return data;
    } catch (e) {
        if (error.mostrar)
            console.log(e);
        return null;
    }
}

async function filtro(objeto) {
    try {
        const data = await pool.query('INSERT INTO ' + tabla + ' SET ?', [objeto]);
        return data;
    } catch (e) {
        if (error.mostrar)
            console.log(e);
        return null;
    }
}

function lista() {
    try {
        const data = pool.query('SELECT * FROM ' + tabla);
        return data;
    } catch (e) {
        if (error.mostrar)
            console.log(e);
        return null;
    }
}



module.exports = {lista};