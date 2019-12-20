import React, { Component } from 'react';

class App extends Component {
    constructor(props){
        super(props);
        this.state = {
            loggedIn: false,        //Especifica si el usuario está logeado.
            userId: '',
            userName: '',           //Nombre del usuario
            userActive: false,      //Especifica si el usuario está activo
            selectedOption: 0,      //Especifica la interfaz donde se encuentra
            shortDate: ''           //Fecha corta
        };
    }

    render() {
        return (
        <h1>{ this.props.name }</h1>
        )
    }
}

export default App;
