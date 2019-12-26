import React from 'react';
import { BtnClose } from '../../Form/BtnClose/BtnClose.jsx';

import './ItemList.css';
//PROPIEDADES -----------------------
// number | stateItem("1","2","3") | alias | name | amountDescription | amount 

export function ItemList(props) {
    let class_br = "";
    let class_bl = "";
    let texto = "";
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

    if (texto == "") {
        class_br = "stateitem_border_br";
        class_bl = "stateitem_border_bl";
    }

    return (
        <div className="col-xs-12 col-sm-6 col-lg-6 mb-3 stateitem">
            <div className={"container stateitem_border_br stateitem_border_bl stateitem_border_tr stateitem_border_tl stateitem_state_" + props.stateItem}>
                <div className="row">
                    <div className={"col-1 stateitem_num stateitem_center stateitem_border_tl " + class_bl}>
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
                        <div className={"row stateitem_amount stateitem_center " + class_br}>
                            <div className="col stateitem_state_amount_description">
                                {props.amountDescription}
                            </div>
                            <div className={"col-5 stateitem_state_amount "  + class_br}>
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