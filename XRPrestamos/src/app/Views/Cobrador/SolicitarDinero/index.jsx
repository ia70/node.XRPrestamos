import React, { Component } from 'react';
import Navbar from '../../Components/Layout/Navbar.jsx';
import { TextSearch } from '../../Components/Form/TextSearch.jsx';
import { Title } from '../../Components/Content/Title.jsx';
import { TextNumber } from '../../Components/Form/TextNumber.jsx';
import {TextMoney} from '../../Components/Form/TextMoney.jsx';

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
                        <Title title="" />
                        <TextSearch />
                        <TextMoney id="dinero" label="Cantidad" holder="Cantidad" help="" required={true}/>
                        <TextNumber id="dias" label="Días" holder="Dias" help="" required={true} />
                    </div>
                </div>
            </div>
        );
    }
}

export default SolicitarDinero;