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
            usuarios: []
        }
    }

    componentDidMount() {
        var peticion = new Request('http://192.168.2.50/api/usuario', {
            method: 'GET',
            mode: 'cors',
            redirect: 'follow',
            headers: new Headers({
                'Content-Type': 'application/json'
            })
        });

        fetch(peticion)
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
        const listItems = [];
        try {
            listItems = this.state.usuarios.map((i) =>
                <ItemList number="1" alias={i.id_usuario} name="Alicia Ocaña Vazquez" amount="550.00" amountDescription="Restante:" />
            );
        } catch (e) {

        }


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
                        {listItems}
                    </div>
                </div>
            </div>
        );
    }
}

export default CarteraClientes;