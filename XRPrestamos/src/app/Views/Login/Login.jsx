// DEPENDENCIES ----------------------------------------------------------------------
import React, { Component } from 'react';
import { Redirect } from 'react-router-dom';
import axios from 'axios';

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
            login: null,
            txtusuario: null,
            txtpassword: null
        };
        this.login = this.login.bind(this);
        this.leer = this.leer.bind(this);
    }

    
    leer(e) {
        const name = e.target.name;
        const value = e.target.value;
        this.setState({
            [name]: value
        })
    };

    login() {
        var url = 'http://192.168.2.80/api/login';
        axios.get(url, {
            params: {
                id_usuario: 'admin',
                password: 'admin2'
            }
        })
            .then(function (response) {
                console.log(response);
            })
            .catch(function (error) {
                this.setState({ login: error });
            })
            .then(function () {
                this.setState({ login: response.login })
            });
    }

    render() {
        const cadena = "";
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
                        <TextBox evento={this.leer} id="txtusuario" label="Usuario" holder="Nombre del usuario" required={true} col={12} />
                        <TextPassword evento={this.leer} id="txtpassword" label="Contraseña" holder="Contraseña" required={true} col={12} />

                        <BtnSubmit id="btnenviar" url="#" label="Entrar" evento={this.login} />
                        {cadena}
                    </div>
                </div>
            </div>
        );
    }
}

export default Login;