import React, { Component } from 'react';
import ReactDOM from 'react-dom';

class App extends Component {
    render() {
        return (
            <h1>Hola Mundo</h1>
        )
    }
}

let container = document.getElementById('root');
let component = <App/>;

ReactDOM.render(component, container);

