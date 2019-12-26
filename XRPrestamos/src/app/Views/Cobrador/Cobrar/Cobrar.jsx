import React, { Component } from 'react';

//CONMPONENTS --------------------------------------------------
import Navbar from '../../../Components/Content/Navbar/Navbar.jsx';
import { TextSearch } from '../../../Components/Form/TextSearch/TextSearch.jsx';
import { Title } from '../../../Components/Content/Title/Title.jsx';
import { TextMoney } from '../../../Components/Form/TextMoney/TextMoney.jsx';
import { TextNumber } from '../../../Components/Form/TextNumber/TextNumber.jsx';
import { DateTimePicker } from '../../../Components/Form/DateTimePicker/DateTimePicker.jsx';
import {BtnSubmit} from '../../../Components/Form/BtnSubmit/BtnSubmit.jsx';

import './SolicitarDinero.css';
import Logo from '../../../img/Logo.png';


class Cobrar extends Component {
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
                        <TextMoney id="dinero" label="Cantidad" holder="Cantidad" help="" required={true} />
                        <TextNumber id="dias" label="Plazo en dias" holder="Plazo en dias" help="" required={true} />
                        <DateTimePicker id="fecha" label="Fecha requerida" holder="Plazo en dias" help="" required={true} />
                    </div>
                    <BtnSubmit label="Guardar" />
                </div>
            </div>
        );
    }
}

export default Cobrar;