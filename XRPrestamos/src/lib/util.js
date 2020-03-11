import { moment } from 'moment';

function getDateTime() {
    var d = new Date();
    var fecha = d.getFullYear() + '-' + d.getDate() + '-' + d.getDay() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
    var fe = moment(fecha, 'YYYY-MM-DD hh:mm:ss a');
    return fe;
}

module.exports = { getDateTime };