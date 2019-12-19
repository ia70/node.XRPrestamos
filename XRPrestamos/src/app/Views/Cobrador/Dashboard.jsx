import React, { Component } from 'react';

//COMPONENTES
import BtnRounded from '../../Components/Content/BtnRounded.jsx';
import NuevoCliente from '../../Views/Nuevo_Cliente.jsx';

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
    constructor() {
        super();
        this.state = {
            tareas: 0
        }

        // Este enlace es necesario para hacer que `this` funcione en el callback
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e) {
        this.setState({tareas: 1});
        console.log(this.state);
        alert("Entro");
        e.preventDefault();       
    }

    render() {
        if(this.state.tareas == 0){
            return (

                <div>
                    <Navbar bg="dark" variant="dark" sticky="top">
                        <Navbar.Brand href="#home">
                            <img
                                alt=""
                                src={Logo}
                                width="30"
                                height="30"
                                className="d-inline-block align-top"
                            />{' '}
                            {this.props.userName}
                        </Navbar.Brand>
                        <Navbar.Toggle />
                        <Navbar.Collapse className="justify-content-end">
                            <Navbar.Text className="Dashboard" >
                                {new Date().toJSON().slice(0, 10)}
                            </Navbar.Text>
                            <Button type="submit">Salir</Button>
                        </Navbar.Collapse>
                    </Navbar>
                    <BtnRounded src={imgCarteraClientes} texto="Cartera de clientes" />
                    <BtnRounded src={imgCobrar} texto="Cobrar" />
                    <BtnRounded src={imgSolicitarDinero} texto="Solicitar dinero" />
                    <BtnRounded src={imgEstadoSolicitud} texto="Estado de solicitudes" />
                    <BtnRounded src={imgNuevoCliente} texto="Nuevo cliente" onClick={(e) => this.handleClick(e)} />
                    <form onSubmit={(e) => this.handleClick(e)} >
                        <button type="submit">Enviar</button>
                    </form>
    
                </div>
            );
        }else{
            return (
                <NuevoCliente>hOLA mUNDO</NuevoCliente>
            );
        }

    }
}

export default Dashboard;