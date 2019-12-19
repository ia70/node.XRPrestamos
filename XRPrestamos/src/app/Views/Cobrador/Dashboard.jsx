import React, { Component } from 'react';

//COMPONENTES
import BtnRounded from '../../Components/Content/BtnRounded.jsx';

// IMAGENES
import CarteraClientes from '../img/CarteraClientes.png';
import Cobrar from '../img/Cobrar.png';
import EstadoSolicitud from '../img/EstadoSolicitud.png';
import NuevoCliente from '../img/NuevoUsuario.png';
import SolicitarDinero from '../img/SolicitarDinero.png';
import Logo from '../img/Logo.png';

// BOOTSTRAP
import { Navbar } from 'react-bootstrap';
import { Button } from 'react-bootstrap';

// CSS
import '../css/Dashboard.css';

class Dashboard extends Component {
    constructor() {
        super();
        this.state = {
            title: "Mi aplicación",
            tareas: 10
        }
    }

    render() {
        return (

            <div>
                <Navbar bg="dark" variant="dark" sticky="top">
                    <Navbar.Brand href="#home">
                        <img
                            alt=""
                            src={ Logo }
                            width="30"
                            height="30"
                            className="d-inline-block align-top"
                        />{' '}
                        {this.props.userName}
                    </Navbar.Brand>
                    <Navbar.Toggle />
                    <Navbar.Collapse className="justify-content-end">
                        <Navbar.Text className="Dashboard" >
                            { new Date().toJSON().slice(0,10) }
                        </Navbar.Text>
                        <Button type="submit">Salir</Button>
                    </Navbar.Collapse>
                </Navbar>
                <BtnRounded src={CarteraClientes} texto="Cartera de clientes" />
                <BtnRounded src={Cobrar} texto="Cobrar" />
                <BtnRounded src={SolicitarDinero} texto="Solicitar dinero" />
                <BtnRounded src={EstadoSolicitud} texto="Estado de solicitudes" />
                <BtnRounded src={NuevoCliente} texto="Nuevo cliente" />
            </div>
        )
    }
}

export default Dashboard;