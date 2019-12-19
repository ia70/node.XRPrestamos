import React, { Component } from 'react';
import ReactDOM from 'react-dom';

import './Views/css/Main.css'
import Dashboard from "./Views/Cobrador/Dashboard.jsx";

let container = document.getElementById('root');


let component = <Dashboard userName="Daniel Pérez"/>;
ReactDOM.render(component, container);

/*
    NO OLVIDAR CAMBIAR DEL WEBPACK DONDE SE SERVIRA EL SERVICIO. SI NO ES CORRECTA NO SE EJECUTARA!
                    *************************************************************
*/