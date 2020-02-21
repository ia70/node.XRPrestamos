const express = require('express');
const morgan = require('morgan');
const path = require('path');
const bodyParser = require('body-parser');

// Initialization ------------------------------------------------ 
const app = express();

// Settings ------------------------------------------------------
app.set('port', process.env.PORT || 80);

// Middlewares ---------------------------------------------------
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.json());

// Routes --------------------------------------------------------                            
app.use('/api', require('./routes/index.routes'));
app.use('/api/user', require('./routes/user.routes'));

//app.use(require('/user', './routes/index.routes'));

// Static files --------------------------------------------------
app.use(express.static(path.join(__dirname, 'public')));

// Global variables ----------------------------------------------


// Starting the server -------------------------------------------
app.listen(app.get('port'), () => {
    console.log('Server on port ', app.get('port'));
});
/*
    NO OLVIDAR CAMBIAR DEL WEBPACK DONDE SE SERVIRA EL SERVICIO. SI NO ES CORRECTA NO SE EJECUTARA!
                    *************************************************************
*/