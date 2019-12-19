import React, { Component } from 'react';
import ReactDOM from 'react-dom';

import Dashboard from "./Views/Cobrador/Dashboard.jsx";

let container = document.getElementById('root');


let component = <Dashboard userName="Daniel Pérez"/>;
ReactDOM.render(component, container);