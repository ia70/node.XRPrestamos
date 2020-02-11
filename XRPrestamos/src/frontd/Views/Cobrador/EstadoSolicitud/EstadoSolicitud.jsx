import React, { Component } from 'react';

//CONMPONENTS --------------------------------------------------
import Navbar from '../../../Components/Content/Navbar/Navbar.jsx.js.js';
import { ItemList } from '../../../Components/Custom/ItemList/ItemList.jsx.js.js';
import { Title } from '../../../Components/Content/Title/Title.jsx.js.js';

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
                <div className="container-fluid">
                    <div className="row">

                        <Title />
                        <ItemList number="1" stateItem={1} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:"  close={true}/>
                        <ItemList number="2" stateItem={3} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:"  close={true}/>
                        <ItemList number="3" stateItem={2} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:"  close={true}/>
                        <ItemList number="4" stateItem={2} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:"  close={true}/>
                        <ItemList number="5" stateItem={1} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:"  close={true}/>
                        <ItemList number="6" stateItem={1} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:"  close={true}/>
                        <ItemList number="7" stateItem={3} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:"  close={true}/>
                        <ItemList number="8" stateItem={1} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:"  close={true}/>
                        <ItemList number="9" stateItem={2} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:"  close={true}/>
                        <ItemList number="10" stateItem={1} alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" close={true} />

                    </div>
                </div>
            </div>
        );
    }
}

export default EstadoSolicitud;