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
                            <h4 className="tm2">{props.name}</h4>
                        </div>


                        <div className="table-responsive">
                            <table className="table">
                                <thead className="thead-dark">
                                    <tr>
                                        <th scope="col">Conc.</th>
                                        <th scope="col">Pagos</th>
                                        <th scope="col">$ Monto</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">Atrasos</th>
                                        <td>3</td>
                                        <td>1500</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Adelantos</th>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Restante</th>
                                        <td>7</td>
                                        <td>3000</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>



                        <div className="row modalcollect_monto m-0 py-0 my-2">
                            Pago del día: ${props.amount}
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