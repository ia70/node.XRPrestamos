import React, { Component } from 'react';
import Navbar from '../../Components/Layout/Navbar.jsx';

import '../css/SolicitarDinero.css';
import Logo from '../img/Logo.png';

class SolicitarDinero extends Component {
    constructor(props) {
        super(props);
        this.state = {
            personal: {
                nombre: '',
                apaterno: '',
                amaterno: '',
                curp: '',
                direccion: '',
                referencias: '',
                celular: '',
                email: '',
                tipo_casa: '',
            },
            negocio: {
                nombre: '',
                tipo: '',
                direccion: '',
                referencias: '',
                celular: '',
                email: '',
                local_ambulante: false,
                tipo_local: '',
            }
        };
    }

    render() {
        return (
            <div>
                <Navbar setLogo={Logo} setTitle="Solicitar Dinero" />
                <div className="container">
                    <div className="row" >

                        <div className="input-group">
                            <input type="text" className="form-control" placeholder="Search this blog" />
                            <div className="input-group-append">
                                <button className="btn btn-secondary" type="button" >
                                    <i className="fa fa-search"></i>
                                </button>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        );
    }
}

export default SolicitarDinero;