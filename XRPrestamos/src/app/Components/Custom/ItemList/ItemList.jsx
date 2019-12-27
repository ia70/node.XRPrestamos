import React from 'react';
import { BtnClose } from '../../Form/BtnClose/BtnClose.jsx';

import './ItemList.css';
/*PROPIEDADES -----------------------------------------------------
    1- numbre               Número de lista
    2- stateItem            Estado (1 Aprobado, 2 En espera, 3 Rechazado )
    3- stateDescription     Texto de descripcion
    4- alias                Alias del cliente
    5- name                 Nombre completo del cliente
    6- amountDescription    Descripción del monto
    7- amount               Monto $
    8- close                Mostrar boton cerrar (true, false)
*/
export function ItemList(props) {
    let btncerrar = <BtnClose label="X" />;
    let class_br = "";
    let class_bl = "";
    let texto = "";

    if (!props.close) {
        btncerrar = "";
    }

    if (props.stateDescription == "") {
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
            case 4 || "4":
                texto = "Pendiente";
                break;
        }
    } else {
        texto = props.stateDescription;
    }

    if (texto == "") {
        class_br = "stateitem_border_br";
        class_bl = "stateitem_border_bl";
    }

    return (
        <div className="col-xs-12 col-sm-6 col-lg-4 col-xl-3 mb-3 stateitem">
            <div className={"container-fluid stateitem_border_br stateitem_border_bl stateitem_border_tr stateitem_border_tl stateitem_state_" + props.stateItem}>
                <div className="row">
                    <div className={"col-auto stateitem_num stateitem_center stateitem_border_tl " + class_bl}>
                        <h2>{props.number}</h2>
                    </div>
                    <div className="col">
                        <div className="row stateitem_alias stateitem_center stateitem_border_tr">
                            <div className="col stateitem_center">
                                {props.alias}
                            </div>
                            {btncerrar}
                        </div>
                        <div className="row stateitem_name stateitem_center">
                            {props.name}
                        </div>
                        <div className={"row stateitem_center " + class_br}>
                            <div className="col stateitem_state_amount_description">
                                {props.amountDescription}
                            </div>
                            <div className={"col-auto stateitem_state_amount " + class_br}>
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