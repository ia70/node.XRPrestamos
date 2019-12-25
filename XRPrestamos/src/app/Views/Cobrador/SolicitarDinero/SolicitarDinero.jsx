import React, { Component } from 'react';

//CONMPONENTS --------------------------------------------------
import Navbar from '../../../Components/Content/Navbar/index.jsx';
import { TextSearch } from '../../../Components/Form/TextSearch/index.jsx';
import { Title } from '../../../Components/Content/Title/Title.jsx';
import { TextMoney } from '../../../Components/Form/TextMoney/index.jsx';

import './desing.css';
import Logo from '../../../img/Logo.png';

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
                        <TextMoney id="dinero" label="Cantidad" holder="Cantidad" help="" required={true} />

                    </div>
                </div>
            </div>
        );
    }
}

export default SolicitarDinero;