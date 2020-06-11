import React, { Component } from 'react';
import keys from '../../../../keys';
//PROPIEDADES -----------------------
/*
    - id            Identificador único para cada componente
    - label         Etiqueta o texto que se mostrará
    - tabla         Nombre de la tabla de la base de datos que será el origen de datos
    - items         Arreglo de elementos del combobox
    - value         Nombre del campo que se almacenará en propiedad value del selecoption
    - description   Nombre del campo que contiene el texto que se mostrará en el combo box
*/

const max = 178542, min = 413;
class ComboBox extends Component {

    constructor(props) {
        super(props);
        this._isMounted = false;
        this._isUpdate = false;

        this._elementos = ["e"];

        this.state = {
            elementos: []
        };
        this.evento = this.evento.bind(this);
    }

    componentDidMount() {
        this._isMounted = true;
        try {
            if (this._isUpdate == false) {
                this._isUpdate = true;
                var url = keys.api.url;
                if (this.props.tabla != null) {
                    url += this.props.tabla;
                    fetch(url, {
                        method: 'GET',
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    }).then(res => res.json())
                        .catch(error => console.error(error))
                        .then(response => {
                            if (this._isMounted) {
                                this.setState({ 'elementos': response[this.props.tabla] });
                            }
                        });
                } else {
                    if (this._isMounted) {
                        this.setState({ 'elementos': this.props.items });
                    }
                }
            }
        } catch (e) {
            console.log(e);
        }
    }

    componentWillUnmount() {
        this._isMounted = false;
        this._elementos = [""];
    }

    componentWillUpdate() {
        this._isUpdate = true;
    }

    evento() {
        try {
            if (this.props.evento != null) {
                this.props.evento((e) => this.props.evento(this.leer(e)))
            }
        } catch (error) {
        }
    }

    componentDidUpdate() {
        this.evento();
    }

    render() {
        try {
            this._elementos = this.props.items;
        } catch (error) {
            this._elementos = [""];
        }

        let valu = "";
        let des = "";
        let lista = [];

        try {
            valu = this.props.value;
            des = this.props.description;
        } catch (error) {
            it = null;
        }

        if (this.props.tabla != null) {
            if (valu != null) {
                lista = this.state.elementos.map(i => <option key={this.props.id + 'opt' + Math.random() * (max - min) + min} value={i[valu]} >{i[des]}</option>);
            } else
                lista = "";
        } else {
            try {
                lista = this._elementos.map(i => <option key={this.props.id + 'opt' + Math.random() * (max - min) + min} value={i[valu]} >{i[des]}</option>);
            } catch (e) {
            }
        }

        return (
            <div className="form-group col-xs-12 col-sm-4 col-lg-4">
                <label key={'lbl' + this.props.id + Math.random() * (max - min) + min} htmlFor={this.props.id}>{this.props.label || "Seleccione una opción."}</label>
                <select key={'sel' + this.props.id + Math.random() * (max - min) + min} className="form-control" id={this.props.id} onChange={this.evento} >
                    {lista}
                </select>
            </div>
        );
    }
}

export default ComboBox;