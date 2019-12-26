import React from 'react';
import './BtnSubmit.css';
//PROPIEDADES
// label
export function BtnSubmit(props) {
    return (
            <button type="submit" className="btn btn-success col-xs-12 col-sm-12 col-lg-3" >{props.label}</button>
    );
}