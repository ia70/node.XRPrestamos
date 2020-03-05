import React, { Component } from 'react';

//CONMPONENTS --------------------------------------------------
import Navbar from '../../../Components/Content/Navbar/Navbar.jsx';
import { ItemList } from '../../../Components/Custom/ItemList/ItemList.jsx';
import { Title } from '../../../Components/Content/Title/Title.jsx';
import { TextSearch } from '../../../Components/Form/TextSearch/TextSearch.jsx';
const { database } = require('../../../../../src/keys');

import Logo from '../../../img/Logo.png';
import './CarteraClientes.css';


class CarteraClientes extends Component {
    constructor(props) {
        super(props);
        this.state = {
            usuarios: []
        }
    }

    componentDidMount() {
        var url = 'http://' + database.host + '/api/usuario';

        fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        })
            .then((response) => {
                return response.json();
            })
            .then((usuarios) => {
                this.setState({ usuarios: usuarios['usuario'] });
            })
            .catch((err) => {
                console.error(err);
            });
    }

    render() {
        var indice = 0;
        const listItems = this.state.usuarios.map((i) =>
            <ItemList key={i.id_usuario} alias={i.id_usuario} number={++indice} name="Alicia Ocaña Vazquez" amount="550.00" amountDescription="Restante:" />
        );

        return (
            <div>
                <Navbar setTitle="Cartera de clientes" setLogo={Logo} setButton={true}/>
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