import React, { Component } from 'react';
import { Redirect } from 'react-router-dom';
import keys from '../../../../keys';
import Fecha from '../../../../lib/util.js';
// COMPONENTES ----------------------------------------------------



import './ModalCollect.css';
/*PROPIEDADES -----------------------------------------------------
    1- numbre               Número de lista
    2- stateItem            Estado (1 Aprobado, 2 En espera, 3 Rechazado )
*/
class ModalCollect extends Component {

    constructor(props) {
        super(props);

        this._isMounted = false;
        this._isUpdate = false;

        this.state = {
            login: sessionStorage.getItem('login'),
            user: sessionStorage.getItem('user'),
            sucursal: sessionStorage.getItem('sucursal'),
            hash: sessionStorage.getItem('hash'),
            rol: sessionStorage.getItem('rol'),
            info_credito: {
                folio_credito: "",
                ine: "",
                monto_credito: 0,
                monto_total: 0,
                monto_pago: 0,
                pagado: 0,
                atrasos_no: 0,
                atrasos_monto: 0,
                extra_no: 0,
                extra_monto: 0,
                restante_no: 0,
                restante_monto: 0,
                restante_total: 0,
                abono_hoy: 0
            },
            solicitud: [],
        };

        this.enviar = this.enviar.bind(this);
    }

    enviar(num) {
        if (this._isMounted) {
            var url = keys.api.url + 'cobrar_pago';
            let _monto = 0;

            if (num == 1)
                _monto = document.getElementById('txtmonto' + this.props.number).value;

            var data_text = {
                solicitud: {
                    folio_credito: this.state.info_credito.folio_credito,
                    monto: _monto,
                    no_pagos: 0,
                    id_tipo_pago: 0,
                    fecha_abono: Fecha.getShortDate(),
                    id_estado: 1,
                    fecha_reg: Fecha.getDateTime()
                },
                adicional: this.state.info_credito,
                user: {
                    user: this.state.user,
                    sucursal: this.state.sucursal,
                    hash: this.state.hash,
                    rol: this.state.rol
                }
            };

            console.log(data_text);

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
                            alert('¡Error al guardar!');
                    } else {
                        sessionStorage.clear();
                        alert('¡Sesion bloqueada!');
                        this.setState({ login: false });
                    }
                });
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
        } else {
            let _atrasos = this.props.atrasos_monto;
            let _extras = this.props.extras_monto;
            let _extras_no = this.props.extras_no;

            if (_extras > 0) {
                if (_extras > _atrasos) {
                    _atrasos = 0;
                    _extras = _extras - _atrasos;
                    if (_extras_no > this.props.atrasos_no) {
                        _extras_no = _extras_no - this.props.atrasos_no;
                    } else {
                        _extras_no = 0;
                    }
                } else {
                    _atrasos = _atrasos - _extras;
                    _extras = 0;
                    _extras_no = 0;
                }
            }

            this.setState({
                info_credito: {
                    folio_credito: this.props.folio_credito,
                    ine: this.props.ine,
                    monto_credito: this.props.monto_credito,
                    monto_total: this.props.monto_total,
                    monto_pago: this.props.monto_pago,
                    pagado: this.props.pagado,
                    atrasos_no: this.props.atrasos_no,
                    atrasos_monto: _atrasos,
                    extras_no: _extras_no,
                    extras_monto: _extras,
                    restante_no: this.props.restante_no,
                    restante_monto: this.props.restante_monto,
                    restante_total: this.props.restante_total,
                    abono_hoy: this.props.abono_hoy
                }
            });
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
            <div className="modal fade" id={this.props.id} data-backdrop="static" tabIndex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div className="modal-dialog" role="document">
                    <div className="modal-content modalcollect">
                        <div className="modal-body p-0 d-flex flex-column">


                            <div className="d-flex row modalcollect_alias m-0">
                                <div className="col">
                                    <h2 className="tm1" >{this.props.alias || ""}</h2>
                                </div>

                                <div className="col-auto">
                                    <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </div>

                            <div className="row modalcollect_name m-0 align-items-center">
                                <h4 className="tm2">{this.props.nombre}</h4>
                            </div>

                            <div className="row modalcollect_name m-0 align-items-center">
                                <a className="h5 text-warning" href={"tel:" + this.props.telefono}>Tel. {this.props.telefono}</a>
                            </div>

                            <div className="table table-responsive table-hover">
                                <table className="table">
                                    <thead className="thead-dark">
                                        <tr>
                                            <th scope="col"></th>
                                            <th scope="col">Pagos</th>
                                            <th scope="col">$ Monto</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr className="table-success">
                                            <th scope="row">Prestamo</th>
                                            <td></td>
                                            <td className="text-primary"><strong>{this.props.monto_credito}</strong></td>
                                        </tr>
                                        <tr className="table-primary">
                                            <th scope="row">Total a pagar</th>
                                            <td></td>
                                            <td className="text-primary"><strong>{this.props.monto_total}</strong></td>
                                        </tr>
                                        <tr className="table-warning">
                                            <th scope="row">Pagado</th>
                                            <td></td>
                                            <td className="text-primary"><strong>{this.props.pagado}</strong></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Atrasos</th>
                                            <td>{this.state.info_credito.atrasos_no}</td>
                                            <td className="text-danger">{this.state.info_credito.atrasos_monto}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Adelantos</th>
                                            <td>{this.state.info_credito.extras_no}</td>
                                            <td className="text-success">{this.state.info_credito.extras_monto}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Restante</th>
                                            <td>{this.props.restante_no}</td>
                                            <td className="text-info">{this.props.restante_monto}</td>
                                        </tr>
                                        <tr className="table-info">
                                            <th scope="row" >Restante total</th>
                                            <td></td>
                                            <td className="text-primary"><strong>{this.props.restante_total}</strong></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>



                            <div className="row modalcollect_monto m-0 py-0 my-2">
                                <span className="h3"> Pago del día:        <strong className="text-primary">{"    $" + this.props.monto_pago}</strong> </span>
                            </div>

                            <div className="row modalcollect_body m-0 p-1">

                                <div className="input-group bg-warning mx-3 my-1 p-1">
                                    <input id={'txtmonto' + this.props.number} type="number" className="form-control" min={0} placeholder="Pago recibido:" aria-label="Text input with radio button" />
                                </div>

                                <div className="w-100"></div>
                            </div>
                        </div>
                        <div className="modal-footer px-3 mx-0">
                            <div className="col-2">
                                <button type="button" className="btn btn-info col-12 text-white">Info.</button>
                            </div>
                            <div className="col">
                                <button id={this.props.id + "btnNoPago"} type="button" className="btn btn-danger col-12 text-white" onClick={(e) => this.enviar(0)}>No pagó</button>
                            </div>
                            <div className="col">
                                <button id={this.props.id + "btnGuardar"} type="button" className="btn btn-success col-12 text-white" onClick={(e) => this.enviar(1)}>Guardar pago</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default ModalCollect;