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

        sessionStorage.setItem('route', 'nuevocliente');

        this.state = {
            login: sessionStorage.getItem('login'),
            user: sessionStorage.getItem('user'),
            sucursal: sessionStorage.getItem('sucursal'),
            hash: sessionStorage.getItem('hash'),
        };

        this.enviar = this.enviar.bind(this);
    }

    enviar() {
        var url = keys.api.url + 'nuevo_cliente';

        var data_text = {
            persona: {
                ine_clave: document.getElementById('p_ine').value,
                ine_ref: null,
                alias: document.getElementById('p_alias').value,
                nombre: document.getElementById('p_nombre').value,
                apellido_paterno: document.getElementById('p_apaterno').value,
                apellido_materno: document.getElementById('p_amaterno').value,
                id_calle: 1,
                direccion: document.getElementById('p_direccion').value,
                no_casa: document.getElementById('p_no_casa').value,
                referencias: document.getElementById('p_referencia').value,
                foto_casa: null,
                telefono: document.getElementById('p_telefono').value,
                correo: document.getElementById('p_email').value,
                foto: null,
                ine_img: null,
                id_tipo_inmueble: 1,
                id_estado: 5,
                fecha_reg: getDateTime()
            },
            establecimiento: {
                ine_clave: document.getElementById('p_ine').value,
                nombre: document.getElementById('n_nombre').value,
                id_calle: null,
                numero_ext: null,
                referencias: document.getElementById('n_referencia').value,
                id_actividad_economica: null,
                id_tipo_inmueble: document.getElementById('n_tipo_inmueble').value,
                id_tipo_local: document.getElementById('n_tipo_local').value,
                documento_adicional: null,
                disponibilidad_hr_inicio: document.getElementById('n_hora_inicio').value,
                disponibilidad_hr_fin: document.getElementById('n_hora_fin').value,
                coordenadas: document.getElementById('n_coordenadas').value,
                foto: null,
                id_ruta: document.getElementById('c_ruta').value,
                id_estado: 5
            },
            aval: {
                ine_clave: document.getElementById('p_ine').value,
                nombre: document.getElementById('a_nombre').value,
                apellido_paterno: document.getElementById('a_apaterno').value,
                apellido_materno: document.getElementById('a_amaterno').value,
                direccion: null,
                telefono: document.getElementById('a_telefono').value,
                parentesco: document.getElementById('a_parentesco').value
            },
            user: {
                user: this.state.user,
                sucursal: this.state.sucursal,
                hash: this.state.hash
            }
        };

        console.log(data_text['persona']);
        fetch(url, {
            method: 'POST', // or 'PUT'
            body: JSON.stringify(data_text), // data can be `string` or {object}!
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