import React, { Component } from 'react';
import ComboBox from '../../../Components/Form/ComboBox/ComboBox.jsx';

//CONMPONENTS --------------------------------------------------
import Navbar from '../../../Components/Content/Navbar/Navbar.jsx';
import TextSearchExt from '../../../Components/Form/TextSearchExt/TextSearchExt.jsx';
import { Title } from '../../../Components/Content/Title/Title.jsx';
import { TextMoney } from '../../../Components/Form/TextMoney/TextMoney.jsx';
import { TextNumber } from '../../../Components/Form/TextNumber/TextNumber.jsx';
import { DateTimePicker } from '../../../Components/Form/DateTimePicker/DateTimePicker.jsx';
import { BtnSubmit } from '../../../Components/Form/BtnSubmit/BtnSubmit.jsx';
import TextBox from '../../../Components/Form/TextBox/TextBox.jsx';
import keys from '../../../../keys';

import './SolicitarDinero.css';
import Logo from '../../../img/Logo.png';

class SolicitarDinero extends Component {
    constructor(props) {
        super(props);

        sessionStorage.setItem('route', 'solicitardinero');

        this._isMounted = false;
        this._isUpdate = false;

        this.state = {
            login: sessionStorage.getItem('login'),
            user: sessionStorage.getItem('user'),
            sucursal: sessionStorage.getItem('sucursal'),
            hash: sessionStorage.getItem('hash'),
            rol: sessionStorage.getItem('rol'),
            tipo_cobro: [],
            filtro: []
        };

        this.filtrar = this.filtrar.bind(this);
    }
    

    filtrar(cadena) {
        cadena = cadena.toLowerCase();
        if (cadena == "" || cadena == null) {
            this.setState({filtro: []});
        } else {
            if (this._isMounted == true) {
                var url = keys.api.url + 'persona/filtrar_clientes';

                var data_text = {
                    user: this.state.user,
                    sucursal: this.state.sucursal,
                    hash: this.state.hash,
                    filtro: cadena
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
                        this.setState({
                            filtro: response.persona
                        });
                    });
            }
        }

    }
    componentDidMount() {
        this._isMounted = true;
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
            <React.Fragment>
                <Navbar setLogo={Logo} setTitle="Solicitar Dinero" setButton={true} />
                <div className="container-fluid">
                    <div className="row m-0" >
                        <Title title="" />
                        <TextSearchExt id="sol_search" label="Buscar" evento={this.filtrar}  />
                        <TextBox id="sol_ineclave" label="INE" holder="Clave de Credencial" readonly={true}></TextBox>
                        <ComboBox id="sol_listaclientes" label="Cliente" items={this.state.filtro} value={"ine_clave"} description={"nombre"} ></ComboBox>
                        

                        <TextMoney id="dinero" label="Cantidad" holder="Cantidad" help="" required={true} />
                        <TextNumber id="dias" label="Plazo en dias" holder="Plazo en dias" help="" required={true} />
                        <ComboBox id="solicitar" label="Periodo de cobro" tabla='tipo_cobro' value={"id_tipo_cobro"} description={"descripcion"} ></ComboBox>
                        <DateTimePicker id="fecha" label="Fecha requerida" holder="Plazo en dias" help="" required={true} />
                    </div>
                    <BtnSubmit label="Guardar" />
                </div>
            </React.Fragment>
        );
    }
}

export default SolicitarDinero;