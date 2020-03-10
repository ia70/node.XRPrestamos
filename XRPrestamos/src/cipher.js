const crypto = require('crypto');
const algorithm = 'aes-256-ctr';

function encode(pass, info) {
    var cipher = crypto.createCipher(algorithm, pass);
    cipher = Buffer.concat([cipher.update(info), cipher.final()]);
    return cipher;
}

function decode(pass, info) {
    var decipher = crypto.createDecipher(algorithm, pass);
    decipher = Buffer.concat([decipher.update(info), decipher.final()]);
    return decipher;
}