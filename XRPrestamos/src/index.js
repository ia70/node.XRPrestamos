const express = require('express');
const morgan = require('morgan');
const path = require('path');
const bodyParser = require('body-parser');
const cors = require('cors');
const { server } = require('./keys');

// Initialization ------------------------------------------------ 
const app = express();
app.use(cors());

// Settings ------------------------------------------------------
app.set('port', process.env.PORT || 80);

// Middlewares ---------------------------------------------------
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Routes --------------------------------------------------------                            
app.use('/api', require('./routes/index.routes'));
app.use('/api/usuario', require('./routes/usuario.routes'));
app.use('/api/actividad_economica', require('./routes/actividad_economica.routes'));
app.use('/api/aval', require('./routes/aval.routes'));
app.use('/api/calle', require('./routes/calle.routes'));
app.use('/api/capital', require('./routes/capital.routes'));
app.use('/api/ciudad', require('./routes/ciudad.routes'));
app.use('/api/colonia', require('./routes/colonia.routes'));
app.use('/api/credito', require('./routes/credito.routes'));
app.use('/api/empresa', require('./routes/empresa.routes'));
app.use('/api/estado_credito', require('./routes/estado_credito.routes'));
app.use('/api/estado', require('./routes/estado.routes'));
app.use('/api/pais', require('./routes/pais.routes'));
app.use('/api/periodo', require('./routes/periodo.routes'));
app.use('/api/permiso', require('./routes/permiso.routes'));
app.use('/api/persona', require('./routes/persona.routes'));
app.use('/api/plazo', require('./routes/plazo.routes'));
app.use('/api/provincia', require('./routes/provincia.routes'));
app.use('/api/rol', require('./routes/rol.routes'));
app.use('/api/ruta', require('./routes/ruta.routes'));
app.use('/api/sucursal', require('./routes/sucursal.routes'));
app.use('/api/tipo_credito', require('./routes/tipo_credito.routes'));
app.use('/api/tipo_inmueble', require('./routes/tipo_inmueble.routes'));
app.use('/api/tipo_plazo', require('./routes/tipo_plazo.routes'));
app.use('/api/usuario_establecimiento', require('./routes/usuario_establecimiento.routes'));
app.use('/api/usuario_ruta', require('./routes/usuario_ruta.routes'));

// Control de errores
app.use(function (err, req, res, next) {
    console.error(err.stack);
    res.redirect(301, server.host + ':' + server.port);
});

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