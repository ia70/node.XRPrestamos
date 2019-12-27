import React, { Component } from 'react';

//CONMPONENTS --------------------------------------------------
import Navbar from '../../../Components/Content/Navbar/Navbar.jsx';
import { ItemList } from '../../../Components/Custom/ItemList/ItemList.jsx';
import { Title } from '../../../Components/Content/Title/Title.jsx';
import { TextSearch } from '../../../Components/Form/TextSearch/TextSearch.jsx';
import { ComboBox } from '../../../Components/Form/ComboBox/ComboBox.jsx';

import Logo from '../../../img/Logo.png';
import './CarteraClientes.css';


class CarteraClientes extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div>
                <Navbar setTitle="Cartera de clientes" setLogo={Logo} />
                <div className="container-fluid">
                    <div className="row Cobrar">
                        <Title />
                        <ComboBox label="Clientes a mostrar" items={["Todos los clientes", "Por visitar", "Pagaron completo", "Abonaron", "No pagaron"]} />
                        <TextSearch label="Buscar" id="search" />
                    </div>
                    <div className="row">
                        <Title />
                    </div>
                    <div className="row" >

                        <ItemList number="1" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="550.00" amountDescription="Monto solicitado:" stateItem={1} stateDescription="Pagó completo" />
                        <ItemList number="2" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={2} stateDescription="Abonó"/>
                        <ItemList number="3" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={3} stateDescription="No pagó"/>
                        <ItemList number="4" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={4} stateDescription="Por visitar"/>
                        <ItemList number="5" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={1} stateDescription="Pagó completo"/>
                        <ItemList number="6" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={2} stateDescription="Abonó"/>
                        <ItemList number="7" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="550.00" amountDescription="Monto solicitado:" stateItem={3} stateDescription="No pagó"/>
                        <ItemList number="8" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={4} stateDescription="Por visitar"/>
                        <ItemList number="9" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={1} stateDescription="Pagó completo"/>
                        <ItemList number="4" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={2} stateDescription="Abonó"/>
                        <ItemList number="10" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={3} stateDescription="No pagó"/>
                        <ItemList number="120" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={4} stateDescription="Por visitar"/>

                    </div>
                </div>
            </div>
        );
    }
}

export default CarteraClientes;