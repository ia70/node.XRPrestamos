import React, { Component } from 'react';

//COMPONENTES
import BtnRounded from '../../../Components/Content/BtnRounded/BtnRounded.jsx';
import Navbar from '../../../Components/Content/Navbar/Navbar.jsx';

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

        sessionStorage.setItem('route', 'dashboard');

        this.state = {
            login: sessionStorage.getItem('login'),
            user: sessionStorage.getItem('user'),
            sucursal: sessionStorage.getItem('sucursal'),
            hash: sessionStorage.getItem('hash'),
            rol: sessionStorage.getItem('rol')
        };

        this.handleEvento = this.handleEvento.bind(this);
    }

    handleEvento(){
        sessionStorage.clear();
    }

    componentWillMount() {
        if (!sessionStorage.getItem('login') == true) {
            sessionStorage.clear();
            alert('¡Sesion bloqueada!');
            this.setState({ login: false });
        }
    }

    render() {
       //sessionStorage.
        return (
            <div>
                <Navbar setLogo={Logo} setTitle={this.state.user} setDate={true} setButton={true} url={"/login"} evento={this.handleEvento} />

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