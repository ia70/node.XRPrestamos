import React from 'react';
import './Title.css';
//PROPIEDADES
// title
export function Title(props) {
    return (
        <div className="col-12 title">
            {props.title}
        </div>
    );
}