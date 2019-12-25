import React from 'react';
//PROPIEDADES -----------------------
// required | id | label | holder | help

export function TextMoney(props) {
    if (props.required) {
        return (
            <div className="form-group col-xs-12 col-sm-4 col-lg-3">
                <label htmlFor={props.id}>{props.label}</label>
                <div className="input-group">
                    <div className="input-group-prepend">
                        <span className="input-group-text">$</span>
                    </div>
                    <input id={props.id} type="number" className="form-control" aria-label="Amount (to the nearest dollar)" required />
                    <div className="input-group-append">
                        <span className="input-group-text">.00</span>
                    </div>
                </div>
            </div>
        );
    } else {
        return (
            <div className="form-group col-xs-12 col-sm-4 col-lg-3">
                <div className="input-group">
                    <div className="input-group-prepend">
                        <span className="input-group-text">$</span>
                    </div>
                    <input type="text" className="form-control" aria-label="Amount (to the nearest dollar)" />
                    <div className="input-group-append">
                        <span className="input-group-text">.00</span>
                    </div>
                </div>
            </div>
        );
    }
}