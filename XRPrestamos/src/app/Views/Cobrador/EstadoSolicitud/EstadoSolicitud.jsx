import React, { Component } from 'react';

//CONMPONENTS --------------------------------------------------
import Navbar from '../../../Components/Content/Navbar/Navbar.jsx';
import { StateItem } from '../../../Components/Custom/StateItem/StateItem.jsx';
import { Title } from '../../../Components/Content/Title/Title.jsx';

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
                        <StateItem number="1" stateItem={1} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <StateItem number="2" stateItem={3} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <StateItem number="3" stateItem={2} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <StateItem number="4" stateItem={2} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <StateItem number="5" stateItem={1} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <StateItem number="6" stateItem={1} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <StateItem number="7" stateItem={3} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <StateItem number="8" stateItem={1} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <StateItem number="9" stateItem={2} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <StateItem number="10" stateItem={1} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />

                    </div>
                </div>
            </div>
        );
    }
}

export default EstadoSolicitud;