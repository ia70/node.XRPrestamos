import React, { Component } from 'react';
import ReactDOM from 'react-dom';

import App from "./Components/App.jsx.js";

let container = document.getElementById('root');
let component = <App name="Hola Mundo! Propiedad"/>;

ReactDOM.render(component, container);

