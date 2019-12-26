import React from 'react';
import { BtnClose } from '../../Form/BtnClose/BtnClose.jsx';

import './StateItem.css';
//PROPIEDADES -----------------------
// num | no | alias | nombre | monto

export function StateItem(props) {
    let texto = "";
    switch (props.no) {
        case "1":
            texto = "Aprobado";
            break;
        case "2":
            texto = "En espera";
            break;
        case "3":
            texto = "Rechazado";
            break;
    }

    return (
        <div className="col-xs-12 col-sm-6 col-lg-6 mb-3 stateitem">
            <div className={"container stateitem_border_br stateitem_border_bl stateitem_border_tr stateitem_border_tl stateitem_state_" + props.no}>
                <div className="row">
                    <div className="col-1 stateitem_num stateitem_center stateitem_border_tl">
                        <h1>{props.num}</h1>
                    </div>
                    <div className="col">
                        <div className="row stateitem_alias stateitem_center stateitem_border_tr">
                            <div className="col stateitem_center">
                                {props.alias}
                            </div>
                            <BtnClose label="X" />
                        </div>
                        <div className="row stateitem_name stateitem_center">
                            {props.nombre}
                        </div>
                        <div className="row stateitem_amount stateitem_center">
                            <div className="col">
                                Monto solicitado:
                            </div>
                            <div className="col-3">
                                {"$" + props.monto}
                            </div>
                        </div>
                    </div>
                </div>
                <div className="row stateitem_center stateitem_border_br stateitem_border_bl">
                    {texto}
                </div>
            </div>
        </div>
    );
}