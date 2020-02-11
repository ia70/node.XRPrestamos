import React, { Component } from 'react';

//COMPONENTES
import BtnRounded from '../../../Components/Content/BtnRounded/BtnRounded.jsx.js.js.js';
import NuevoCliente from '../../NuevoCliente/NuevoCliente.jsx.js.js.js';
import SolicitarDinero from '../SolicitarDinero/SolicitarDinero.jsx.js.js.js';
import Navbar from '../../../Components/Content/Navbar/Navbar.jsx.js.js.js';
import EstadoSolicitud from '../EstadoSolicitud/EstadoSolicitud.jsx.js.js.js';
import Cobrar from '../Cobrar/Cobrar.jsx.js.js.js';
import CarteraClientes from '../CarteraClientes/CarteraClientes.jsx.js.js.js';


import ModalCollect from '../../../Components/Custom/ModalCollect/ModalCollect.jsx.js.js.js';


// IMAGENES
import imgCarteraClientes from '../../../img/CarteraClientes.png';
import imgCobrar from '../../../img/Cobrar.png';
import imgEstadoSolicitud from '../../../img/EstadoSolicitud.png';
import imgNuevoCliente from '../../../img/NuevoUsuario.png';
import imgSolicitarDinero from '../../../img/SolicitarDinero.png';
import Logo from '../../../img/Logo.png';

// CSS
import './Dashboard.css';

class Dashboard extends Component {
    constructor(props) {
        super(props);

        this.state = {
            loggedIn: false,            //Especifica si el usuario está logeado.
            userId: '',                 //Id de usuario
            userType: 0,                //Tipo de usuario 0- cobrador; 1- Administrador
            userName: 'Chaparro',       //Nombre del usuario
            userActive: false,          //Especifica si el usuario está activo
            guiOption: 0,               //Especifica la interfaz donde se encuentra
            shortDate: '',              //Fecha corta
        };
    }

    render() {
        return (
            <div>
                <Navbar setLogo={Logo} setTitle={this.state.userName} setDate={true} setButton="false" />

                <div className="container-fluid">
                    <div className="row">
                        <BtnRounded id='1' src={imgCarteraClientes} url="/carteraclientes" label="Cartera de clientes" />
                        <BtnRounded id='2' src={imgCobrar} url="/cobrar" label="Cobrar" />
                        <BtnRounded id='3' src={imgSolicitarDinero} url="/solicitardinero" label="Solicitar dinero" />
                        <BtnRounded id='4' src={imgEstadoSolicitud} url="/estadosolicitud" label="Estado de solicitudes" />
                        <BtnRounded id='5' src={imgNuevoCliente} url="/nuevocliente" label="Nuevo cliente" />
                    </div>
                </div>
            </div>
        );
    }
}

export default Dashboard;