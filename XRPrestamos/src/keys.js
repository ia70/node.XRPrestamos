'use strict';
module.exports = {
    database: {
        host: '192.168.1.50',
        user: 'xcoru',
        password: 'xcoru12345',
        database: 'xrprestamos'
    },
    server: {
        host: '192.168.1.65',
        port: 80
    },
    security: {
        main_password: '@as_T69?1pq-XoAsqlfpZ_@rgsfdlwoX',
        client_password: 'dO_@-tpA59z-klwquf02_gofldj_2-3R',
        iv_password: '@_aTfdh%Mkxd-k_Q'     //Exactamente 16 caracteres
    },
    api: {
        url: 'http://' + this.database.host + '/api/'
    }
};