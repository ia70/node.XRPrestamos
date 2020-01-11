import React, { Component } from 'react';

//CONMPONENTS --------------------------------------------------
import NavbarExtends from '../../../Components/Content/NavbarExtends/NavbarExtends.jsx';
import { ItemList } from '../../../Components/Custom/ItemList/ItemList.jsx';
import { Title } from '../../../Components/Content/Title/Title.jsx';
import { TextSearch } from '../../../Components/Form/TextSearch/TextSearch.jsx';
import { ComboBox } from '../../../Components/Form/ComboBox/ComboBox.jsx';

import ModalCollect from '../../../Components/Custom/ModalCollect/ModalCollect.jsx';

import Logo from '../../../img/Logo.png';
import './Cobrar.css';


class Cobrar extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div>
                <NavbarExtends title="Cobrar" label1="A recaudar" label2="$90,350" />
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

                        <ItemList modal={true} number="1" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="550.00" amountDescription="Monto solicitado:" stateItem={1} stateDescription="Pagó completo" />
                        <ItemList modal={true} number="2" alias="Fruteria El Eden" name="Marcos Jimenez Lopez" amount="1,500" amountDescription="Monto solicitado:" stateItem={2} stateDescription="Abonó" />
                        <ItemList modal={true} number="3" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={3} stateDescription="No pagó" />
                        <ItemList modal={true} number="4" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={4} stateDescription="Por visitar" />
                        <ItemList modal={true} number="5" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={1} stateDescription="Pagó completo" />
                        <ItemList modal={true} number="6" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={2} stateDescription="Abonó" />
                        <ItemList modal={true} number="7" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="550.00" amountDescription="Monto solicitado:" stateItem={3} stateDescription="No pagó" />
                        <ItemList modal={true} number="8" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={4} stateDescription="Por visitar" />
                        <ItemList modal={true} number="9" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={1} stateDescription="Pagó completo" />
                        <ItemList modal={true} number="4" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={2} stateDescription="Abonó" />
                        <ItemList modal={true} number="10" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={3} stateDescription="No pagó" />
                        <ItemList modal={true} number="120" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" stateItem={4} stateDescription="Por visitar" />

                    </div>
                </div>
            </div>
        );
    }
}

export default Cobrar;