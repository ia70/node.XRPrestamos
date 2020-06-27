const moment = require('moment');

function getDateTime() {
    var d = moment();
    return moment().format('YYYY-MM-DD hh:mm:ss');
}

function getShortDate(){
    var d = moment();
    return moment().format('YYYY-MM-DD');
}

function getShortDateMX(){
    var d = moment();
    return moment().format('DD-MM-YYYY');
}

module.exports = { getDateTime, getShortDate, getShortDateMX };