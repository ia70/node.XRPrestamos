import React from 'react';
import './BtnSubmit.css';

/* --> PROPIEDADES
    1- id
    2- label

*/
export function BtnSubmit(props) {
    return (
            <button type="button" id={props.id || "c01"} type="submit" className="btn btn-success col-xs-12 col-sm-12 col-lg-3" >{props.label || "Guardar"}</button>
    );
}