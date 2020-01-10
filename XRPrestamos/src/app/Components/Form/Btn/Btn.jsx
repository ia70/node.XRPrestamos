import React from 'react';

import './Btn.css';
//PROPIEDADES
// label | clases
export function Btn(props) {
    let clasesI = "btn-warning";

    if(props.clases != null){
        clasesI = props.clases;
    }

    return (
        <button type="button" className={"btn " + clasesI } >{props.label || "<"} </button>
    );
}