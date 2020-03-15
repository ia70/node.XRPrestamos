import React, { Component } from 'react';

//CONMPONENTS --------------------------------------------------
import Navbar from '../../../Components/Content/Navbar/Navbar.jsx';
import { ItemList } from '../../../Components/Custom/ItemList/ItemList.jsx';
import { Title } from '../../../Components/Content/Title/Title.jsx';
import { TextSearch } from '../../../Components/Form/TextSearch/TextSearch.jsx';
const { database } = require('../../../../../src/keys');

import Logo from '../../../img/Logo.png';
import './CarteraClientes.css';

const max = 178542, min = 413;
class CarteraClientes extends Component {
    constructor(props) {
        super(props);

        this._isMounted = false;
        this._isUpdate = false;

        sessionStorage.getItem('login');
        sessionStorage.getItem('user');
        sessionStorage.getItem('hash');
        sessionStorage.setItem('route', "carteraclientes");

        this.state = {
            login: null,
            user: null,
            hash: null
        }
    }

    componentDidMount() {
        this._isMounted = true;
        try {
            if (this._isUpdate == false) {
                this._isUpdate = true;
                var url = keys.api.url;
                if (this.props.tabla != null) {
                    url += this.props.tabla;
                    fetch(url, {
                        method: 'GET',
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    }).then(res => res.json())
                        .catch(error => console.error(error))
                        .then(response => {
                            if (this._isMounted) {
                                this.setState({ 'elementos': response[this.props.tabla] });
                            }
                        });
                } else if (this.props.items != null) {
                    url = this.props.items;
                    if (this._isMounted) {
                        this.setState({ 'elementos': url });
                    }
                }
            }
        } catch (e) {
            console.log(e);
        }
    }

    componentWillUnmount() {
        this._isMounted = false;
    }

    render() {
        var indice = 0;
        const listItems = this.state.usuarios.map((i) =>
            <ItemList key={i.id_usuario} alias={i.id_usuario} number={++indice} name="Alicia Ocaña Vazquez" amount="550.00" amountDescription="Restante:" />
        );

        return (
            <div>
                <Navbar setTitle="Cartera de clientes" setLogo={Logo} setButton={true} />
                <div className="container-fluid">
                    <div className="row Cobrar">
                        <Title />
                        <TextSearch label="Buscar" id="search" />
                    </div>
                    <div className="row">
                        <Title />
                    </div>
                    <div className="row" >
                        {listItems}
                    </div>
                </div>
            </div>
        );
    }
}

export default CarteraClientes;