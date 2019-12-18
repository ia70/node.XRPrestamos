import React, { Component } from 'react';
import ReactDOM from 'react-dom';

import App from "./component/App.jsx";

let container = document.getElementById('root');
let component = <App name="Hola Mundo! Propiedad"/>;

ReactDOM.render(component, container);

