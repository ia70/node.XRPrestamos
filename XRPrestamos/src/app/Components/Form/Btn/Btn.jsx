import React from 'react';

import './Btn.css';
//PROPIEDADES
// label
export function Btn(props) {
    return (
        <button className="btn btn-warning" >{props.label || "A"} </button>
    );
}