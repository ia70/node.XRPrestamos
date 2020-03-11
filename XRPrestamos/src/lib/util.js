import { moment } from 'moment';

function getDateTime() {
    var d = new Date();
    var fecha = d.getFullYear() + '-' + d.getDate() + '-' + d.getDay() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
    return moment(fecha).format('YYYY-MM-DD HH:MM:SS');
}

module.exports = { getDateTime };