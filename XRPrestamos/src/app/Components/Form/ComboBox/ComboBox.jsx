import React, { Component } from 'react';
//PROPIEDADES -----------------------
// items , label, id

class ComboBox extends Component {

    constructor(props) {
        super(props);
        this.state = {
            elementos: []
        };
    }

    componentWillMount() {
        try {
            var url="";
            if (this.props.url != null) {
                url = this.props.url;
                fetch(url, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                }).then(res => res.json())
                    .catch(error => console.error(error))
                    .then(response => {
                        this.setState({ 'elementos': response.ruta });
                    });
            }else if(this,this.props.items != null){
                url = this.props.items;
                this.setState({ 'elementos': url });
            }
        } catch (e) {
            console.log(e);
        }
    }

    render() {
        var lista = null;
        if (this.state.elementos.length > 0) {
            lista = this.state.elementos.map(i => <option key={i.id_ruta}>{i.descripcion}</option>);
        } else
            lista = "";
        return (
            <div className="form-group col-xs-12 col-sm-4 col-lg-4">
                <label htmlFor={this.props.id}>{this.props.label || "Seleccione una opción."}</label>
                <select className="form-control" id={this.props.id}>
                    {lista}
                </select>
            </div>
        );
    }
}

export default ComboBox;