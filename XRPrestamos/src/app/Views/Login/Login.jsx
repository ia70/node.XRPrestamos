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
        var url = 'http://192.168.2.50/api/login';
        var data = {
            id_usuario: 'admin',
            password: 'admin'
        };

        fetch(url, {
            method: 'POST', // or 'PUT'
            body: JSON.stringify(data), // data can be `string` or {object}!
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(res => res.json())
            .catch(error => {
                console.error('Error:', error)
            })
            .then(response => {
                console.log('Success:', response)
            });
            
        return ({});
    }

    render() {

        if (this.state.login == true) {
            window.location = "/dashboard";
        }

        return (
            <div className="contenedor" >
                <div className="column p-0 justify-content-center login login_body">
                    <div className="row justify-content-center m-0 login_title">
                        <h3>Login</h3>
                    </div>
                    <div className="row justify-content-center m-0 my-3 login_body">
                        <TextBox id="txtuser" label="Usuario" holder="Nombre del usuario" required={true} col={12} />
                        <TextPassword id="txtpassword" label="Contraseña" holder="Contraseña" required={true} col={12} />

                        <BtnSubmit id="btnenviar" url="#" label="Entrar" evento={this.login} />
                    </div>
                </div>
            </div>
        );
    }
}

export default Login;