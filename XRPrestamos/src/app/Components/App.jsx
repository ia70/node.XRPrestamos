import React, { Component } from 'react';

class App extends Component {
    constructor(){
        super();
        this.state = {
            title: "Mi aplicación",
            tareas: 10
        }
    }

    render() {
        return (
        <h1>{ this.props.name }</h1>
        )
    }
}

export default App;
