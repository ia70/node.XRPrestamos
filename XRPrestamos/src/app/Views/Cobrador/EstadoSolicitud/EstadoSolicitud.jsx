import React, { Component } from 'react';

//CONMPONENTS --------------------------------------------------
import Navbar from '../../../Components/Content/Navbar/Navbar.jsx';
import { StateItem } from '../../../Components/Custom/StateItem/StateItem.jsx';
import { TextSearch } from '../../../Components/Form/TextSearch/TextSearch.jsx';
import { Title } from '../../../Components/Content/Title/Title.jsx';
import { TextMoney } from '../../../Components/Form/TextMoney/TextMoney.jsx';
import { TextNumber } from '../../../Components/Form/TextNumber/TextNumber.jsx';
import { DateTimePicker } from '../../../Components/Form/DateTimePicker/DateTimePicker.jsx';
import { BtnSubmit } from '../../../Components/Form/BtnSubmit/BtnSubmit.jsx';

import './EstadoSolicitud.css';
import Logo from '../../../img/Logo.png';


class EstadoSolicitud extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div>
                <Navbar setLogo={Logo} setTitle="Estado de solicitudes" />
                <div className="container">
                    <div className="row">

                        <Title />
                        <StateItem num="1" no="1" alias="Pozolera" nombre="Alicia Ocaña Vazquez" monto="1,500" />
                        <StateItem num="2" no="1" alias="Pozolera" nombre="Alicia Ocaña Vazquez" monto="1,500" />
                        <StateItem num="3" no="3" alias="Pozolera" nombre="Alicia Ocaña Vazquez" monto="1,500" />
                        <StateItem num="4" no="2" alias="Pozolera" nombre="Alicia Ocaña Vazquez" monto="1,500" />
                        <StateItem num="5" no="2" alias="Pozolera" nombre="Alicia Ocaña Vazquez" monto="1,500" />
                        <StateItem num="1" no="1" alias="Pozolera" nombre="Alicia Ocaña Vazquez" monto="1,500" />
                        <StateItem num="2" no="1" alias="Pozolera" nombre="Alicia Ocaña Vazquez" monto="1,500" />
                        <StateItem num="3" no="3" alias="Pozolera" nombre="Alicia Ocaña Vazquez" monto="1,500" />
                        <StateItem num="4" no="2" alias="Pozolera" nombre="Alicia Ocaña Vazquez" monto="1,500" />
                        <StateItem num="5" no="2" alias="Pozolera" nombre="Alicia Ocaña Vazquez" monto="1,500" />

                    </div>
                </div>
            </div>
        );
    }
}

export default EstadoSolicitud;