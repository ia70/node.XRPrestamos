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

                        <ItemPagoTitulo />
                        <ItemPago concepto="Prestamo 24.05.2019" monto="$4,815.00" />
                        <ItemPago concepto="Prestamo 24.05.2019" monto="$4,815.00" />
                        <ItemPago concepto="Prestamo 24.05.2019" monto="$4,815.00" />
                        <ItemPago concepto="Prestamo 24.05.2019" monto="$4,815.00" />
                        <ItemPago concepto="Prestamo 24.05.2019" monto="$4,815.00" />

                        <div className="row modalcollect_monto m-0 py-0 my-2">
                            Pago del día: ${props.amount}
                        </div>

                        <div className="row modalcollect_body m-0 p-1">

                            <div class="input-group bg-warning mx-3 my-1 p-1">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <input id="d1" type="radio" name="exampleRadios" aria-label="Radio button for following text input" defaultChecked={true} />
                                    </div>
                                </div>
                                <input type="number" class="form-control" min={0} placeholder="Abono" aria-label="Text input with radio button" />
                            </div>

                            <div className="w-100"></div>

                            <div className="col my-3">
                                <div className="form-check bg-success text-white py-2 redondear">
                                    <input className="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2" />
                                    <label className="form-check-label" htmlFor="exampleRadios2">
                                        Pagó completo
                                    </label>
                                </div>
                            </div>
                            <div className="col">
                                <div className="form-check bg-danger text-white py-2 redondear">
                                    <input className="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option1" />
                                    <label className="form-check-label" htmlFor="exampleRadios3">
                                        No pagó
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="modal-footer px-3 mx-0">
                        <button type="button" className="btn btn-success col-12 text-white">Guardar</button>
                    </div>
                </div>
            </div>
        </div>
    );
}

/*export function ModalCollect(props) {
    return (
        <div className="modal fade" id={props.id} data-backdrop="static" tabIndex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div className="modal-dialog" role="document">
                <div className="modal-content">
                    <div className="modal-header">
                        <h5 className="modal-title modalcollect" id="staticBackdropLabel">Alias</h5>
                        <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div className="modal-body">
                        <p>Contenido 2</p>
                    </div>
                    <div className="modal-footer">
                        <button type="button" className="btn btn-secondary modalcollect" data-dismiss="modal">Cerrar</button>
                        <button type="button" className="btn btn-primary modalcollect">Guardar</button>
                    </div>
                </div>
            </div>
        </div>
    );
}*/