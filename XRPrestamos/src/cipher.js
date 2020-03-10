var CryptoJS = require("crypto-js");


function encode(pass, info) {
    const hash = crypto.createHmac('sha256', pass)
        .update(info)
        .digest('hex');

    return hash;
}

function decode(pass, info) {
    var bytes = CryptoJS.AES.decrypt(info, pass);
    var originalText = bytes.toString(CryptoJS.enc.Utf8);

    return originalText;
}

module.exports = { encode, decode };