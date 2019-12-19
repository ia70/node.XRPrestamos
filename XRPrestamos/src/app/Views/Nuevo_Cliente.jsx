import React, { Component } from 'react';

class Nuevo_Cliente extends Component {
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

export default Nuevo_Cliente;