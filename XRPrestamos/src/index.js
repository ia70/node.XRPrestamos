const express = require('express');
const morgan = require('morgan');
const path = require('path');

// Initialization ------------------------------------------------ 
const app = express();

// Settings ------------------------------------------------------
app.set('port', process.env.PORT || 80);

// Middlewares ---------------------------------------------------
app.use(morgan('dev'));
app.use(express.json());

// Routes --------------------------------------------------------                            
app.use('/api/tasks', require('./routes/task.routes'));

// Static files --------------------------------------------------
app.use(express.static(path.join(__dirname, 'public')));

// Global variables ----------------------------------------------


// Starting the server -------------------------------------------
app.listen(app.get('port'), () => {
    console.log('Server on port ', app.get('port'));
});