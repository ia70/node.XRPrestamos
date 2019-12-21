import React, { Component } from 'react';
import DashboardAdmin from './Views/Admin/Dashboard.jsx';
import DashboardCobrador from './Views/Cobrador/Dashboard.jsx';
import Login from './Views/Login.jsx';

class App extends Component {
    constructor(props){
        super(props);
        this.state = {
            loggedIn: true,             //Especifica si el usuario está logeado.
            userId: '001',              //Id de usuario
            userType: 0,                //Tipo de usuario 0- cobrador; 1- Administrador
            userName: 'Daniel Pérez',   //Nombre del usuario
            userActive: false,          //Especifica si el usuario está activo
            guiOption: 0,               //Especifica la interfaz donde se encuentra
            shortDate: ''               //Fecha corta
        };
    }


    render() {

        if(this.state.loggedIn){
            if(this.state.userType == 1){
                return( <DashboardAdmin state={this.state} /> );
            }else{
                return( <DashboardCobrador state={this.state} /> );
            }
        }else{
            return( <Login /> );
        }
    }
}

export default App;
