import React from 'react';

// COMPONENTES ----------------------------------------------------
import { Btn } from '../../Form/Btn/Btn.jsx';
import { ItemPago } from '../ItemPago/ItemPago.jsx';
import { ItemPagoTitulo } from '../ItemPago/ItemPagoTitulo.jsx';
import { TextMoney } from '../../Form/TextMoney/TextMoney.jsx';


import './ModalCollect.css';
/*PROPIEDADES -----------------------------------------------------
    1- numbre               Número de lista
    2- stateItem            Estado (1 Aprobado, 2 En espera, 3 Rechazado )
*/
export function ModalCollect(props) {
    let _atrasos = props.atrasos_monto;
    let _extras = props.extra_monto;
    let _extras_no = props.extra_no;

    if (_extras > 0) {
        if (_extras > _atrasos) {
            _atrasos = 0;
            _extras = _extras - _atrasos;
            if (_extras_no > props.atrasos_no) {
                _extras_no = _extras_no - props.atrasos_no;
            } else {
                _extras_no = 0;
            }
        } else {
            _atrasos = _atrasos - _extras;
            _extras = 0;
            _extras_no = 0;
        }
    }


    return (
        <div className="modal fade" id={props.id} data-backdrop="static" tabIndex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div className="modal-dialog" role="document">
                <div className="modal-content modalcollect">
                    <div className="modal-body p-0 d-flex flex-column">


                        <div className="d-flex row modalcollect_alias m-0">
                            <div className="col">
                                <h2 className="tm1" >{props.alias || ""}</h2>
                            </div>

                            <div className="col-auto">
                                <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div>

                        <div className="row modalcollect_name m-0 align-items-center">
                            <h4 className="tm2">{props.nombre}</h4>
                        </div>

                        <div className="row modalcollect_name m-0 align-items-center">
                            <a className="h5 text-warning" href={"tel:" + props.telefono}>Tel. {props.telefono}</a>
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
                                        <td className="text-primary"><strong>{props.monto_credito}</strong></td>
                                    </tr>
                                    <tr className="table-warning">
                                        <th scope="row">Pagado</th>
                                        <td></td>
                                        <td className="text-primary"><strong>{props.pagado}</strong></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Atrasos</th>
                                        <td>{props.atrasos_no}</td>
                                        <td className="text-danger">{_atrasos}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Adelantos</th>
                                        <td>{_extras_no}</td>
                                        <td className="text-success">{_extras}</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Restante</th>
                                        <td>{props.restante_no}</td>
                                        <td className="text-info">{props.restante_monto}</td>
                                    </tr>
                                    <tr className="table-info">
                                        <th scope="row" >Restante total</th>
                                        <td></td>
                                        <td className="text-primary"><strong>{props.restante_total}</strong></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>



                        <div className="row modalcollect_monto m-0 py-0 my-2">
                           <span className="h3"> Pago del día:        <strong className="text-primary">{"    $" + props.monto_pago}</strong> </span>
                        </div>

                        <div className="row modalcollect_body m-0 p-1">

                            <div className="input-group bg-warning mx-3 my-1 p-1">
                                <input id={'txtmonto' + props.number} type="number" className="form-control" min={0} placeholder="Pago recibido:" aria-label="Text input with radio button" />
                            </div>

                            <div className="w-100"></div>
                        </div>
                    </div>
                    <div className="modal-footer px-3 mx-0">
                        <div className="col-2">
                            <button type="button" className="btn btn-info col-12 text-white">Info.</button>
                        </div>
                        <div className="col">
                            <button type="button" className="btn btn-danger col-12 text-white">No pagó</button>
                        </div>
                        <div className="col">
                            <button type="button" className="btn btn-success col-12 text-white">Guardar pago</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}