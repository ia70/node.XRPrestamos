import React, { Component } from 'react';

class Nuevo_Cliente extends Component {
    constructor(props){
        super(props);
        this.state = {
            personal: {
                nombre: '',
                apaterno: '',
                amaterno: '',
                curp: '',
                direccion: '',
                referencias: '',
                celular: '',
                email: '',
                tipo_casa: '',
            },
            negocio: {
                nombre: '',
                tipo: '',
                direccion: '',
                referencias: '',
                celular: '',
                email: '',
                local_ambulante: false,
                tipo_local: '',
            }
        }; 
    }

    render() {
        return (
        <h1>Nuevo Cliente</h1>
        )
    }
}

export default Nuevo_Cliente;