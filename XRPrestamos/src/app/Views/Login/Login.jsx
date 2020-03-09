// DEPENDENCIES ----------------------------------------------------------------------
import React, { Component } from 'react';
import { Redirect } from 'react-router-dom';

//COMPONENTS -------------------------------------------------------------------------
import TextBox from '../../Components/Form/TextBox/TextBox.jsx';
import { TextPassword } from '../../Components/Form/TextPassword/TextPassword.jsx';
import { BtnSubmit } from '../../Components/Form/BtnSubmit/BtnSubmit.jsx';
import './Login.css';

const keys = require('../../../keys');
const data = require('../../../cipher');


//PROPIEDADES ------------------------------
//setLogo | setTitle | setDate

class Login extends Component {

    constructor(props) {
        super(props);
        this.state = {
            login: null,
            txtusuario: null,
            txtpassword: null
        };

        this.enviar = this.enviar.bind(this);
    }

    enviar() {
        var usuario = document.getElementById('txtusuario').value;
        var password = document.getElementById('txtpassword').value;

        var e_user = data.encode(keys.security.client_password.toString, usuario);
        var e_pass = data.encode(keys.security.client_password.toString, password);

        var url = 'http://' + keys.database.host + '/api/login?usr=' + e_user + '&pwd=' + e_pass;

        fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(res => res.json())
            .catch(error => console.error(error))
            .then(response => this.setState(response));
    }

    render() {
        if (this.state.login == true) {
            return (
                <Redirect
                    from="/"
                    to="/dashboard" />
            );
        } else if (this.state.login == false) {
            this.setState({ login: null })
            alert("Datos incorrectos!");
        }

        return (
            <div className="contenedor" >
                <div className="column p-0 justify-content-center login login_body">
                    <div className="row justify-content-center m-0 login_title">
                        <h3>Login</h3>
                    </div>
                    <div className="row justify-content-center m-0 my-3 login_body">
                        <TextBox id="txtusuario" label="Usuario" holder="Nombre del usuario" required={true} col={12} />
                        <TextPassword id="txtpassword" label="Contraseña" holder="Contraseña" required={true} col={12} />

                        <BtnSubmit id="btnenviar" url="#" label="Entrar" evento={this.enviar} />
                    </div>
                </div>
            </div>
        );
    }
}

export default Login;