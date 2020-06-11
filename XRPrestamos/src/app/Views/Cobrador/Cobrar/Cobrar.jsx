import React, { Component } from 'react';
import { Redirect } from 'react-router-dom';

//CONMPONENTS --------------------------------------------------
import NavbarExtends from '../../../Components/Content/NavbarExtends/NavbarExtends.jsx';
import { ItemList } from '../../../Components/Custom/ItemList/ItemList.jsx';
import { Title } from '../../../Components/Content/Title/Title.jsx';
import TextSearch from '../../../Components/Form/TextSearch/TextSearch.jsx';
import { ComboBox } from '../../../Components/Form/ComboBox/ComboBox.jsx';
import keys from '../../../../keys';

import './Cobrar.css';

class Cobrar extends Component {
    constructor(props) {
        super(props);
        
        sessionStorage.setItem('route', 'cobrar');

        this._isMounted = false;
        this._isUpdate = false;

        this.state = {
            login: sessionStorage.getItem('login'),
            user: sessionStorage.getItem('user'),
            sucursal: sessionStorage.getItem('sucursal'),
            hash: sessionStorage.getItem('hash'),
            rol: sessionStorage.getItem('rol'),
            solicitud: []
        };
    }

        
    componentWillUnmount() {
        this._isMounted = false;
    }

    componentWillMount() {
        if (!sessionStorage.getItem('login') == 'true') {
            sessionStorage.clear();
            alert('¡Sesion bloqueada!');
            this.setState({ login: false });
        }
    }

    render() {
        if (this.state.login == false) {
            var ruta = "/";
            return (
                <Redirect
                    from="/"
                    to={ruta} />
            );
        }

        return (
            <div>
                <NavbarExtends title="Cobrar" label1="A recaudar" label2="$90,350" />
                <div className="container-fluid">
                    <div className="row Cobrar">
                        <Title />

                        <TextSearch label="Buscar" id="search_cartera" evento={this.filtrar} />
                    </div>
                    <div className="row">
                        <Title />
                    </div>
                    <div className="row" >

                        <ItemList modal={true} number="1" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="550.00" amountDescription="Pago del día:" stateItem={1} stateDescription="Pagó completo" />
                        <ItemList modal={true} number="2" alias="Fruteria El Eden" name="Marcos Jimenez Lopez" amount="1,500" amountDescription="Pago del día:" stateItem={2} stateDescription="Abonó" />
                        <ItemList modal={true} number="3" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Pago del día:" stateItem={3} stateDescription="No pagó" />
                        <ItemList modal={true} number="4" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Pago del día:" stateItem={4} stateDescription="Por visitar" />
                        <ItemList modal={true} number="5" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Pago del día:" stateItem={1} stateDescription="Pagó completo" />
                        <ItemList modal={true} number="6" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Pago del día:" stateItem={2} stateDescription="Abonó" />
                        <ItemList modal={true} number="7" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="550.00" amountDescription="Pago del día:" stateItem={3} stateDescription="No pagó" />
                        <ItemList modal={true} number="8" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Pago del día:" stateItem={4} stateDescription="Por visitar" />
                        <ItemList modal={true} number="9" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Pago del día:" stateItem={1} stateDescription="Pagó completo" />
                        <ItemList modal={true} number="4" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Pago del día:" stateItem={2} stateDescription="Abonó" />
                        <ItemList modal={true} number="10" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Pago del día:" stateItem={3} stateDescription="No pagó" />
                        <ItemList modal={true} number="120" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Pago del día:" stateItem={4} stateDescription="Por visitar" />
                        <ItemList modal={true} number="120" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Pago del día:" stateItem={5} stateDescription="Por visitar" />

                    </div>
                </div>
            </div>
        );
    }
}

export default Cobrar;