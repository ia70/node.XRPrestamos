
function getDateTime() {
    var d = new Date();
    return d.getFullYear() + '-' + d.getDate + '-' + d.getDay + ' ' + d.getHours + ':' + d.getMinutes + ':' + d.getSeconds + ' ' + d.getTime;
}

module.exports = { getDateTime };