import React from 'react';
import { BtnClose } from '../../Form/BtnClose/BtnClose.jsx';

import './ItemList.css';
//PROPIEDADES -----------------------
// number | stateItem("1","2","3") | alias | name | amountDescription | amount 

export function ItemList(props) {
    let texto = "Sin Asignar";
    switch (props.stateItem) {
        case 1 || "1":
            texto = "Aprobado";
            break;
        case 2 || "2":
            texto = "En espera";
            break;
        case 3 || "3":
            texto = "Rechazado";
            break;
    }

    return (
        <div className="col-xs-12 col-sm-6 col-lg-6 mb-3 stateitem">
            <div className={"container stateitem_border_br stateitem_border_bl stateitem_border_tr stateitem_border_tl stateitem_state_" + props.stateItem}>
                <div className="row">
                    <div className="col-1 stateitem_num stateitem_center stateitem_border_tl">
                        <h1>{props.number}</h1>
                    </div>
                    <div className="col">
                        <div className="row stateitem_alias stateitem_center stateitem_border_tr">
                            <div className="col stateitem_center">
                                {props.alias}
                            </div>
                            <BtnClose label="X" />
                        </div>
                        <div className="row stateitem_name stateitem_center">
                            {props.name}
                        </div>
                        <div className="row stateitem_amount stateitem_center">
                            <div className="col">
                                {props.amountDescription}
                            </div>
                            <div className="col-3">
                                {"$" + props.amount}
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