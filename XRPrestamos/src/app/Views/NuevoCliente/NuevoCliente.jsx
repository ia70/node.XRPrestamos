import React, { Component } from 'react';
import Navbar from '../../Components/Content/Navbar/Navbar.jsx';
import { Title } from '../../Components/Content/Title/Title.jsx';
import TextBox from '../../Components/Form/TextBox/TextBox.jsx';
import { TextPhoneNumber } from '../../Components/Form/TextPhoneNumber/TextPhoneNumber.jsx';
import { Option } from '../../Components/Form/Option/Option.jsx';
import { TextEmail } from '../../Components/Form/TextEmail/TextEmail.jsx';
import { BtnSubmit } from '../../Components/Form/BtnSubmit/BtnSubmit.jsx';
import { ComboBox } from '../../Components/Form/ComboBox/ComboBox.jsx';
import { FileInput } from '../../Components/Form/FileInput/FileInput.jsx';

import Logo from '../../img/Logo.png';

class NuevoCliente extends Component {
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

    enviar() {
        var usuario = document.getElementById('txtusuario').value;
        var password = document.getElementById('txtpassword').value;

        console.log(usuario + " -- " + password);

        var url = 'http://' + database.host + '/api/login?id_usuario=' + usuario + '&password=' + password;

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
        return (
            <div>
                <Navbar setLogo={Logo} setTitle="Nuevo Cliente" setButton={true} />
                <div className="container-fluid">
                    <div className="row" >
                        <Title title="DATOS PERSONALES" />

                        <TextBox id="p_ine" label="INE" holder="Clave de Credencial" help="" required={true} />
                        <TextBox id="p_nombre" label="Nombre" holder="Nombre del cliente" help="" required={true} />
                        <TextBox id="p_apaterno" label="A. Paterno" holder="Apellido paterno" help="" required={true} />
                        <TextBox id="p_amaterno" label="A. Materno" holder="Apellido materno" help="" required={true} />

                        <ComboBox id="p_pais" label="Pais" items=""></ComboBox>
                        <ComboBox id="p_estado" label="Estado" items=""></ComboBox>
                        <ComboBox id="p_municipio" label="Municipio" items={[]}></ComboBox>
                        <TextBox id="p_colonia" label="Colonia" holder="Colonia" help="" required={true} />
                        <TextBox id="p_calle" label="Calle" holder="Calle" help="" required={true} />
                        <TextBox id="p_no_casa" label="Número exterior" holder="Número exterior" help="" required={true} />



                        <TextBox id="p_referencia" label="Referencia" holder="Referencia" help="" required={true} />
                        <TextPhoneNumber id="p_telefono" label="Telefono" holder="Telefono" help="" required={false} />

                        <FileInput id="p_foto_ine" label="Foto INE" holder="Foto INE"  ></FileInput>
                        <FileInput id="p_foto_personal" label="Foto Personal" holder="Foto Personal"  ></FileInput>
                        <FileInput id="p_foto_domicilio" label="Foto Domicilio" holder="Foto Domicilio"  ></FileInput>


                        <TextEmail id="p_email" label="Correo electrónico" holder="Correo electrónico" help="" required={false} />
                        <div className="btn-group form-group col-xs-12 col-sm-4 col-lg-3" data-toggle="buttons">
                            <Option id="p_casarentada" label="Casa rentada" checked={true} name="p_casa" />
                            <Option id="p_casapropia" label="Casa propia" checked={false} name="p_casa" />
                        </div>


                        <Title title="DATOS DEL NEGOCIO" />

                        <TextBox id="n_nombre" label="Nombre del Negocio" holder="Nombre del Negocio" help="" required={true} />
                        <TextBox id="n_tipoactividad" label="Tipo Negocio (Pozoleria...)" holder="Tipo Negocio (Pozoleria...)" help="" required={true} />
                        <TextBox id="n_referencia" label="Referencia" holder="Referencia" help="" required={true} />

                        <TextPhoneNumber id="n_telefono" label="Telefono" holder="Telefono" help="" required={false} />
                        <TextEmail id="n_email" label="Correo electrónico" holder="Correo electrónico" help="" required={false} />
                        <TextBox id="n_dispo_inicio" label="Hr. Ini. Disponibilidad" holder="Hr. Ini. Disponibilidad" help="" required={true} />
                        <TextBox id="n_dispo_fin" label="Hr. Fin. Disponibilidad" holder="Hr. Fin. Disponibilidad" help="" required={true} />
                        <TextBox id="n_coordenadas" label="Coordenadas" holder="Coordenadas" help="" required={true} />
                        <FileInput id="n_foto" label="Foto Negocio" holder=""  ></FileInput>
                        <div className="btn-group form-group col-xs-12 col-sm-4 col-lg-3" data-toggle="buttons">
                            <Option id="n_localfijo" label="Local Fijo" checked={true} name="p_tipolocal" />
                            <Option id="n_localambulante" label="Local Ambulante" checked={false} name="p_tipolocal" />
                        </div>
                        <div className="btn-group form-group col-xs-12 col-sm-4 col-lg-3" data-toggle="buttons">
                            <Option id="n_localpropio" label="Local propio" checked={true} name="p_tipolocal2" />
                            <Option id="n_localrentado" label="Local rentado" checked={false} name="p_tipolocal2" />
                            <Option id="n_empleado" label="Empleado" checked={false} name="p_tipolocal2" />
                        </div>


                        <Title title="DATOS DEL AVAL" />

                        <TextBox id="a_nombre" label="Nombre" holder="Nombre del cliente" help="" required={true} />
                        <TextBox id="a_apaterno" label="A. Paterno" holder="Apellido paterno" help="" required={true} />
                        <TextBox id="a_amaterno" label="A. Materno" holder="Apellido materno" help="" required={true} />
                        <TextPhoneNumber id="a_telefono" label="Telefono" holder="Telefono" help="" required={false} />
                        <TextBox id="a_parentesco" label="Parentesco" holder="Parentesco" help="" required={true} />

                        <Title title="COBRANZA" />
                        <ComboBox id="c_ruta" label="Asignar a ruta" items=""></ComboBox>

                    </div>
                    <div className="row">
                        <div className="btn-group form-group col-12">
                            <BtnSubmit id="btnenviar" url="#" label="Entrar" evento={this.enviar} />
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default NuevoCliente;