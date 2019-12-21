import React, { Component } from 'react';

//COMPONENTES
import BtnRounded from '../../Components/Content/BtnRounded.jsx';
import NuevoCliente from '../../Views/Nuevo_Cliente.jsx';
import GetDate from '../../Components/utils/GetDate.jsx';

// IMAGENES
import imgCarteraClientes from '../img/CarteraClientes.png';
import imgCobrar from '../img/Cobrar.png';
import imgEstadoSolicitud from '../img/EstadoSolicitud.png';
import imgNuevoCliente from '../img/NuevoUsuario.png';
import imgSolicitarDinero from '../img/SolicitarDinero.png';
import Logo from '../img/Logo.png';

// BOOTSTRAP
import { Navbar } from 'react-bootstrap';
import { Button } from 'react-bootstrap';

// CSS
import '../css/Dashboard.css';

class Dashboard extends Component {
    constructor(props) {
        super(props);

        this.state = {
            loggedIn: false,            //Especifica si el usuario está logeado.
            userId: '',                 //Id de usuario
            userType: 0,                //Tipo de usuario 0- cobrador; 1- Administrador
            userName: '',               //Nombre del usuario
            userActive: false,          //Especifica si el usuario está activo
            guiOption: 0,               //Especifica la interfaz donde se encuentra
            shortDate: '',              //Fecha corta
        };

        // Este enlace es necesario para hacer que `this` funcione en el callback
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(id) {
        console.log('CONSOLA: ' + id + "-> " + this.state.guiOption);
        this.setState(state =>({
            guiOption: id
        }));
    }

    render() {
        switch (this.state.guiOption) {
            case 0:
                return (
                    <div className="noBorder">
                        <Navbar bg="dark" variant="dark" sticky="top" >
                            <Navbar.Brand href="#home">
                                <img
                                    alt=""
                                    src={Logo}
                                    width="30"
                                    height="30"
                                    className="d-inline-block align-top"
                                />{' '}
                                {this.state.userName}
                            </Navbar.Brand>
                            <Navbar.Toggle />
                            <Navbar.Collapse className="justify-content-end">
                                <Navbar.Text className="Dashboard" >
                                    <GetDate />
                                </Navbar.Text>
                                <Button type="submit">Salir</Button>
                            </Navbar.Collapse>
                        </Navbar>
                        <BtnRounded id='1' src={imgCarteraClientes} event={this.handleClick} texto="Cartera de clientes" />
                        <BtnRounded id='2' src={imgCobrar} event={this.handleClick} texto="Cobrar" />
                        <BtnRounded id='3' src={imgSolicitarDinero} event={this.handleClick} texto="Solicitar dinero" />
                        <BtnRounded id='4' src={imgEstadoSolicitud} event={this.handleClick} texto="Estado de solicitudes" />
                        <BtnRounded id='5' src={imgNuevoCliente} event={this.handleClick} texto="Nuevo cliente" />
                    </div>
                );
            case 1:
                return(null);
            case 2:
                return(null);
            case 3:
                return(null);
            case 4:
                return(null);
            case 5:
                return (
                    <NuevoCliente/>
                );
        }
    }
}

export default Dashboard;