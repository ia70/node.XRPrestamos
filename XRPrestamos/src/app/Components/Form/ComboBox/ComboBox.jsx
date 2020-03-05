import React from 'react';
//PROPIEDADES -----------------------
// items , label, id

export function ComboBox(props) {

    return (
        <div className="form-group col-xs-12 col-sm-6 col-lg-6">
            <label htmlFor={props.id}>{props.label || "Seleccione una opción."}</label>
            <select className="form-control" id={props.id}>
                
            </select>
        </div>
    );
}