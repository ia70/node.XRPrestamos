import React from 'react';
//PROPIEDADES -----------------------
// required | id | label | holder | help

export function TextSearch(props) {
        let cadena = "";

        console.log(props.id);
        try{
            cadena=document.getElementById("search_cartera").value;
        }catch(e){
            cadena="";
            console.log(e);
        }
        
        return (
            <div className="form-group col-xs-12 col-sm-6 col-lg-6" onClick={props.evento("fds")}>
                <label htmlFor={props.id}>{props.label}</label>
                <div className="input-group">
                    <input id={props.id} type="text" className="form-control" placeholder="Buscar" aria-label="Recipient's username" aria-describedby="button-addon2" onClick={props.evento("hola")} />
                    <div className="input-group-append">
                        <button className="btn btn-outline-secondary" type="button" id="button-addon2" onClick={props.evento("hola")}>Buscar</button>
                    </div>
                </div>
            </div>
        );
    
}