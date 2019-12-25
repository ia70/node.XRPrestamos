import React from 'react';
//PROPIEDADES -----------------------
// required | id | label | holder | help

export function TextSearch(props) {
    return (
        <div className="form-group col-12">
            <div className="input-group mb-3">
                <input type="text" className="form-control" placeholder="Buscar" aria-label="Recipient's username" aria-describedby="button-addon2" />
                <div className="input-group-append">
                    <button className="btn btn-outline-secondary" type="button" id="button-addon2">Buscar</button>
                </div>
            </div>
        </div>
    );
}