import React from 'react';


import './ItemPago.css';

/* --> PROPIEDADES
    1- id
    2- label

*/
export function ItemPago(props) {
    return (
        <div className="row px-3 itempago m-0">
            <div className="col-8">
                <h6>{props.concepto}</h6>
            </div>
            <div className="col-4">
                <h6>{props.monto}</h6>
            </div>
        </div>
    );
}