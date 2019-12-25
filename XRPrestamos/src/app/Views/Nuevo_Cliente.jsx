import React, { Component } from 'react';
import Navbar from '../Components/Layout/Navbar.jsx';
import { Title } from '../Components/Content/Title.jsx';
import { TextBox } from '../Components/Form/TextBox.jsx';
import { TextTelefono } from '../Components/Form/TextTelefono.jsx';
import { Option } from '../Components/Form/Option.jsx';
import { TextEmail } from '../Components/Form/TextEmail.jsx';

import Logo from '../Views/img/Logo.png';
import './css/NuevoCliente.css';

class Nuevo_Cliente extends Component {
    constructor(props) {
        super(props);
        this.state = {
            personal: {
                nombre: '',
                apaterno: '',
                amaterno: '',
                curp: '',
                direccion: '',
                referencias: '',
                celular: '',
                email: '',
                tipo_casa: '',
            },
            negocio: {
                nombre: '',
                tipo: '',
                direccion: '',
                referencias: '',
                celular: '',
                email: '',
                local_ambulante: false,
                tipo_local: '',
            }
        };
    }

    render() {
        return (
            <div>
                <Navbar setLogo={Logo} setTitle="Nuevo Cliente" />
                <div className="container">
                    <div className="row" >
                        <Title title="DATOS PERSONALES" />

                        <TextBox id="p_nombre" label="Nombre" holder="Nombre del cliente" help="" required={true} />
                        <TextBox id="p_apaterno" label="A. Paterno" holder="Apellido paterno" help="" required={true} />
                        <TextBox id="p_amaterno" label="A. Materno" holder="Apellido materno" help="" required={true} />

                        <TextBox id="p_curp" label="CURP" holder="Clave unica de registro de población" help="" required={true} />
                        <TextBox id="p_direccion" label="Dirección" holder="Dirección" help="" required={true} />
                        <TextBox id="p_referencia" label="Referencia" holder="Referencia" help="" required={true} />

                        <TextTelefono id="p_telefono" label="Telefono" holder="Telefono" help="" required={false} />
                        <TextEmail id="p_email" label="Correo electrónico" holder="Correo electrónico" help="" required={false} />
                        <div className="btn-group form-group col-xs-12 col-sm-4 col-lg-3" data-toggle="buttons">
                            <Option id="p_casarentada" label="Casa rentada" checked={true} name="p_casa" />
                            <Option id="p_casapropia" label="Casa propia" checked={false} name="p_casa" />
                        </div>
                        <Title title="DATOS DEL NEGOCIO" />

                    </div>
                </div>
            </div>
        );
    }
}

export default Nuevo_Cliente;