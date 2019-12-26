import React from 'react';

import './BtnClose.css';

//PROPIEDADES
// label
export function BtnClose(props) {
    return (
            <button className="col-1 btn btn-danger btnclose" >{props.label}</button>
    );
}