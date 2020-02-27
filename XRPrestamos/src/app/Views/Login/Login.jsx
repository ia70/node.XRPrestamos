// DEPENDENCIES ----------------------------------------------------------------------
import React, { Component } from 'react';
import { Link } from 'react-router-dom';

//COMPONENTS -------------------------------------------------------------------------
import { TextBox } from '../../Components/Form/TextBox/TextBox.jsx';
import { TextPassword } from '../../Components/Form/TextPassword/TextPassword.jsx';
import { BtnSubmit } from '../../Components/Form/BtnSubmit/BtnSubmit.jsx';
const { server } = require('../../../keys.js');



import './Login.css';


//PROPIEDADES ------------------------------
//setLogo | setTitle | setDate

class Login extends Component {

    constructor(props) {
        super(props);
        this.state = {
            login: false
        };
        this.login = this.login.bind(this);
    }

    login() {
        var peticion = new Request('http://192.168.2.50/api/login', {
            method: 'GET',
            headers: new Headers({
                'Content-Type': 'application/json'
            }),
        });

        fetch(peticion, {
            id_usuario: 'admin',
            password: 'admin'
        })
            .then((response) => {
                return response.json();
            })
            .then((respuesta) => {
                this.setState({ login: respuesta.login });
            })
            .catch((err) => {
                console.error(err);
            });
    }

    render() {
        return (
            <div className="contenedor">
                <div className="column p-0 justify-content-center login login_body">
                    <div className="row justify-content-center m-0 login_title">
                        <h3>Login</h3>
                    </div>
                    <div className="row justify-content-center m-0 my-3 login_body">
                        <TextBox id="txtuser" label="Usuario" holder="Nombre del usuario" required={true} col={12} />
                        <TextPassword id="txtpassword" label="Contraseña" holder="Contraseña" required={true} col={12} />

                        <div onClick={this.login} className="col d-flex justify-content-center"><BtnSubmit id="btnenviar" url={(this.state.login) ? "/dashboard" : ""} label="Entrar" /></div>
                    </div>
                </div>
            </div>
        );
    }
}

export default Login;