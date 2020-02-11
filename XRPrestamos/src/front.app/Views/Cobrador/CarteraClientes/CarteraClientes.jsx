import React, { Component } from 'react';

//CONMPONENTS --------------------------------------------------
import Navbar from '../../../Components/Content/Navbar/Navbar.jsx.js.js.js';
import { ItemList } from '../../../Components/Custom/ItemList/ItemList.jsx.js.js.js';
import { Title } from '../../../Components/Content/Title/Title.jsx.js.js.js';
import { TextSearch } from '../../../Components/Form/TextSearch/TextSearch.jsx.js.js.js';
import { ComboBox } from '../../../Components/Form/ComboBox/ComboBox.jsx.js.js.js';

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
                        <TextSearch label="Buscar" id="search" />
                    </div>
                    <div className="row">
                        <Title />
                    </div>
                    <div className="row" >

                        <ItemList number="1" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="550.00" amountDescription="Restante:"  />
                        <ItemList number="2" alias="Floreria" name="Manuel Ovando Laynes" amount="14,450" amountDescription="Restante:"/>
                        <ItemList number="3" alias="Lavanderia" name="Ernesto Sanchez" amount="4,800" amountDescription="Restante:"  />
                        <ItemList number="4" alias="Taqueria" name="Alicia Ocaña Vazquez" amount="3,200" amountDescription="Restante:"  />
                        <ItemList number="5" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Restante:"  />
                        <ItemList number="6" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Restante:"  />
                        <ItemList number="7" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="550.00" amountDescription="Restante:" />
                        <ItemList number="8" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Restante:"  />
                        <ItemList number="9" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Restante:"  />
                        <ItemList number="4" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Restante:"  />
                        <ItemList number="10" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Restante:" />
                        <ItemList number="120" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Restante:"/>

                    </div>
                </div>
            </div>
        );
    }
}

export default CarteraClientes;