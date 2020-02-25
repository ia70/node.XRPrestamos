import React, { Component } from 'react';

//CONMPONENTS --------------------------------------------------
import Navbar from '../../../Components/Content/Navbar/Navbar.jsx';
import { ItemList } from '../../../Components/Custom/ItemList/ItemList.jsx';
import { Title } from '../../../Components/Content/Title/Title.jsx';
import { TextSearch } from '../../../Components/Form/TextSearch/TextSearch.jsx';
const { server } = require('../../../../../src/keys');

import Logo from '../../../img/Logo.png';
import './CarteraClientes.css';


class CarteraClientes extends Component {
    constructor(props) {
        super(props);
        this.state = {
            usuarios: [],
            isloading: true
        }
    }

    componentDidMount() {
        fetch('http://192.168.2.80:8080/api/usuario')
            .then(response => response.json())
            .then(usuario => this.setState({ usuarios: usuario.result, isloading: false }))
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
                        <ItemList number="1" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="550.00" amountDescription="Restante:" />
                    </div>
                </div>
            </div>
        );
    }
}

export default CarteraClientes;