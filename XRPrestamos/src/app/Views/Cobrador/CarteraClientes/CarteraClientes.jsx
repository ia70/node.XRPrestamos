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

        sessionStorage.setItem('route', 'carteraclientes');

        this.isUpdate = false;

        this.state = {
            login: sessionStorage.getItem('login'),
            user: sessionStorage.getItem('user'),
            sucursal: sessionStorage.getItem('sucursal'),
            hash: sessionStorage.getItem('hash'),
            rol: sessionStorage.getItem('rol'),
            cartera: []
        };

        this.enviar = this.enviar.bind(this);
    }

    componentDidMount() {
        if (!this.isUpdate) {
            this.enviar();
        }
    }

    enviar() {
        var url = keys.api.url + 'cartera_clientes';

        var data_text = {
            user: this.state.user,
            sucursal: this.state.sucursal,
            hash: this.state.hash
        };

        fetch(url, {
            method: 'POST',
            body: JSON.stringify(data_text),
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(res => res.json())
            .catch(error => {
                console.error('Error:', error)
            })
            .then(response => {
                if (response.session) {

                    if (response.response) {
                        alert('¡Registro guardado!');
                    } else
                        alert('¡Error al insertar!');


                } else {
                    sessionStorage.clear();
                    alert('¡Sesion bloqueada!');
                    this.setState({ login: false });
                }
            });
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

        var indice = 0;
        const listItems = this.state.cartera.map((i) =>
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