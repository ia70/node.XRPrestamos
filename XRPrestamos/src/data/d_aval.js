import pool from '.';
import { error } from '../config';

const tabla = "aval";
const primary_key = "id_aval";

class d_aval {

    insertar(objeto) {
        try {
            const data = await pool.query('INSERT INTO ' + tabla + ' SET ?', [objeto]);
            return data;
        } catch (e) {
            if (error.mostrar)
                console.log(e);
            return null;
        }
    }

    editar(objeto) {
        try {
            const data = await pool.query('UPDATE ' + tabla + ' SET ? WHERE ' + primary_key + ' = ?', [objeto, objeto[primary_key]]);
            return data;
        } catch (e) {
            if (error.mostrar)
                console.log(e);
            return null;
        }
    }

    eliminar(objeto) {
        try {
            const data = await pool.query('DELETE FROM ' + tabla + ' WHERE ' + primary_key + ' = ?', [objeto[primary_key]]);
            return data;
        } catch (e) {
            if (error.mostrar)
                console.log(e);
            return null;
        }
    }

    consulta(objeto) {
        try {
            const data = await pool.query('SELECT * FROM ' + tabla + ' WHERE ' + primary_key + '=?', [objeto[primary_key]]);
            return data;
        } catch (e) {
            if (error.mostrar)
                console.log(e);
            return null;
        }
    }

    filtro(objeto) {
        try {
            const data = await pool.query('INSERT INTO ' + tabla + ' SET ?', [objeto]);
            return data;
        } catch (e) {
            if (error.mostrar)
                console.log(e);
            return null;
        }
    }

    lista() {
        try {
            const data = await pool.query('SELECT * FROM ' + tabla);
            return data;
        } catch (e) {
            if (error.mostrar)
                console.log(e);
            return null;
        }
    }

}

module.exports = { d_aval };