import React from 'react';
//PROPIEDADES -----------------------
// required | id | label | holder | help

export function TextSearch(props) {
    return (
        <div className="form-group col-xs-12 col-sm-6 col-lg-6">
            <label htmlFor={props.id}>{props.label}</label>
            <div className="input-group">
                <input id={props.id} type="text" className="form-control" placeholder="Buscar" aria-label="Recipient's username" aria-describedby="button-addon2" />
                <div className="input-group-append">
                    <button className="btn btn-outline-secondary" type="button" id="button-addon2">Buscar</button>
                </div>
            </div>
        </div>
    );
}