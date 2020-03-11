const moment = require('moment');

function getDateTime() {
    var d = moment();
    return moment().format('YYYY-MM-DD hh:mm:ss');
}

module.exports = { getDateTime };