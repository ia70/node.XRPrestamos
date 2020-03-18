const moment = require('moment');

function getDateTime() {
    var d = moment();
    return moment().format('YYYY-MM-DD hh:mm:ss');
}

function getShortDate(){
    var d = moment();
    return moment().format('YYYY-MM-DD');
}

module.exports = { getDateTime, getShortDate };