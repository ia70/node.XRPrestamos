import React, { Component } from 'react';
import ReactDOM from 'react-dom';

import Nuevo_Cliente from "./Views/Nuevo_Cliente.jsx";

let container = document.getElementById('root');


let component = <Nuevo_Cliente name="Hola Mundo! Propiedad"/>;
ReactDOM.render(component, container);