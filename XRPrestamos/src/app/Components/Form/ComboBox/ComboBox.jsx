import React, { Component } from 'react';
import keys from '../../../../keys';
//PROPIEDADES -----------------------
// items , label, id
const max = 178542, min = 413;
class ComboBox extends Component {


    constructor(props) {
        super(props);
        this._isMounted = false;
        this._isUpdate = false;
        this.state = {
            elementos: []
        };
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
                } else if (this.props.items != null) {
                    url = this.props.items;
                    if (this._isMounted) {
                        this.setState({ 'elementos': url });
                    }
                }
            }
        } catch (e) {
            console.log(e);
        }
    }

    componentWillUnmount() {
        this._isMounted = false;
    }

    render() {
        var lista = null;
        if (this.state.elementos) {
            lista = this.state.elementos.map(i => <option key={this.props.id + 'opt' + Math.random() * (max - min) + min} value={i.id_ruta} > {i.descripcion} </option>);
        } else
            lista = "";
        return (
            <div className="form-group col-xs-12 col-sm-4 col-lg-4">
                <label key={'lbl' + this.props.id + Math.random() * (max - min) + min} htmlFor={this.props.id}>{this.props.label || "Seleccione una opción."}</label>
                <select key={'sel' + this.props.id + Math.random() * (max - min) + min} className="form-control" id={this.props.id}>
                    {lista}
                </select>
            </div>
        );
    }
}

export default ComboBox;