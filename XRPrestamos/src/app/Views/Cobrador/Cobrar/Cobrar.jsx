import React, { Component } from 'react';
import { Redirect } from 'react-router-dom';

//CONMPONENTS --------------------------------------------------
import NavbarExtends from '../../../Components/Content/NavbarExtends/NavbarExtends.jsx';
import { ItemList } from '../../../Components/Custom/ItemList/ItemList.jsx';
import { Title } from '../../../Components/Content/Title/Title.jsx';
import TextSearch from '../../../Components/Form/TextSearch/TextSearch.jsx';
import ComboBox from '../../../Components/Form/ComboBox/ComboBox.jsx';
import keys from '../../../../keys';

import './Cobrar.css';

const max = 178542, min = 413;
class Cobrar extends Component {
    constructor(props) {
        super(props);

        sessionStorage.setItem('route', 'cobrar');

        this._isMounted = false;
        this._isUpdate = false;

        this.state = {
            login: sessionStorage.getItem('login'),
            user: sessionStorage.getItem('user'),
            sucursal: sessionStorage.getItem('sucursal'),
            hash: sessionStorage.getItem('hash'),
            rol: sessionStorage.getItem('rol'),
            opcion: 5,
            total: 0,
            solicitud: [],
            filtro: []
        };

        this.filtrar = this.filtrar.bind(this);
        this.filtrarCombo = this.filtrarCombo.bind(this);
        this.modificarEstado = this.modificarEstado.bind(this);
    }

    filtrar(cadena) {
        if (this._isMounted) {
            let op = document.getElementById("filtro").value;

            cadena = cadena.toLowerCase();
            let datos = [];
            if (cadena == "" || cadena == null) {
                this.filtrarCombo(op);
            } else {
                if (cadena.length > 0) {
                    datos = this.state.solicitud.filter((item) => (item.alias + " " + item.nombre).toLowerCase().indexOf(cadena) >= 0 && (item.id_tipo_pago == op || op == 7));
                    this.setState({ filtro: datos, opcion: op });
                }
            }
        }
    }

    filtrarCombo(cadena) {
        let op = cadena;
        let datos = [];

        if (op == 7) {
            this.setState({ filtro: this.state.solicitud, opcion: op });
        } else {
            datos = this.state.solicitud.filter((item) => (item.id_tipo_pago == cadena));
            this.setState({ filtro: datos, opcion: op });
        }
    }

    modificarEstado(objeto) {
        if (this._isMounted) {
            if (objeto != null) {
                var index = this.state.solicitud.findIndex(obj => obj.folio_credito == objeto.folio_credito);
                if (index >= 0) {
                    let data = this.state.solicitud;
                    data[index] = objeto;
                    this.setState({
                        solicitud: data
                    });
                    this.filtrarCombo(this.state.opcion);
                }
            }
        }
    }

    componentDidMount() {
        this._isMounted = true;
    }

    componentWillUnmount() {
        this._isMounted = false;
    }

    componentWillMount() {
        if (!sessionStorage.getItem('login') == 'true') {
            sessionStorage.clear();
            alert('¡Sesion bloqueada!');
            this.setState({ login: false });
        } else {

            var url = keys.api.url + 'cobrar';

            var data_text = {
                user: this.state.user,
                sucursal: this.state.sucursal,
                hash: this.state.hash
            };

            fetch(url, {
                method: 'POST',
                body: JSON.stringify(data_text),
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(res => res.json())
                .catch(error => {
                    console.error('Error:', error)
                })
                .then(response => {
                    if (response.session) {
                        if (response.response) {
                            if (this._isMounted == true && this._isUpdate == false) {
                                this._isUpdate = true;

                                var total_ = 0;

                                response.solicitud.forEach(i => total_ += i.monto_pago);

                                this.setState({
                                    solicitud: response.solicitud,
                                    filtro: response.solicitud,
                                    total: total_
                                });
                                this.filtrarCombo(5);
                            }
                        }
                    } else {
                        sessionStorage.clear();
                        alert('¡Sesion bloqueada!');
                        this.setState({ login: false });
                    }
                });
        }
    }

    componentDidUpdate() {
        document.getElementById("filtro").value = this.state.opcion;
    }

    render() {
        if (this.state.login == false) {
            var ruta = "/";
            return (
                <Redirect
                    from="/"
                    to={ruta} />
            );
        }

        var indice = 0;
        const listItems = this.state.filtro.map((i) =>
            <ItemList
                key={i.ine + Math.random() * (max - min) + min}
                number={indice + 1}
                amount={i.monto_pago}
                amountDescription="Pago del día:"
                stateItem={i.id_tipo_pago}
                stateDescription={i.descripcion}

                info = {this.state.solicitud[indice++]}

                evento={this.modificarEstado}
                modal={true}
                close={false}
            />
        );

        let combo = [
            {
                "valor": 5,
                "des": "Por visitar"
            },
            {
                "valor": 1,
                "des": "Pago completo"
            },
            {
                "valor": 3,
                "des": "Pago extra"
            },
            {
                "valor": 2,
                "des": "Abono"
            },
            {
                "valor": 4,
                "des": "Sin pago"
            },
            {
                "valor": 6,
                "des": "Fin de pagos"
            },
            {
                "valor": 7,
                "des": "Ver todos"
            }
        ];

        return (
            <div>
                <NavbarExtends title="Cobrar" label1="A recaudar" label2={"$" + this.state.total} />
                <div className="container-fluid">
                    <div className="row Cobrar">
                        <Title />
                        <ComboBox id="filtro" label="Filtrar" items={combo} value={"valor"} description={"des"} evento={this.filtrarCombo} />
                        <TextSearch label="Buscar" id="search_cartera" evento={this.filtrar} />
                    </div>
                    <div className="row">
                        <Title />
                    </div>
                    <div className="row" >

                        {listItems}

                    </div>
                </div>
            </div>
        );
    }
}

export default Cobrar;