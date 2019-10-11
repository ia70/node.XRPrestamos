import express from 'express';
import webpack from 'webpack';
import webpackDevMiddleware from 'webpack-dev-middleware';
import webpackConfig from '../webpack.config';
import morgan from 'morgan';
import path from 'path';

// Initialization ------------------------------------------------ 
const app = express();

// Settings ------------------------------------------------------
app.set('port', process.env.PORT || 3000);

// Middlewares ---------------------------------------------------
app.use(webpackDevMiddleware(webpack(webpackConfig)));
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