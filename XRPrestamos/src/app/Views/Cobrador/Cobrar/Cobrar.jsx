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
            solicitud: [],
        };

        this.leer = this.leer.bind(this);
    }


    componentDidMount() {
        this._isMounted = true;
        if (this._isMounted == true && this._isUpdate == false) {
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
                                this.setState({
                                    solicitud: response.solicitud
                                });
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

    componentWillUnmount() {
        this._isMounted = false;
    }

    componentWillMount() {
        if (!sessionStorage.getItem('login') == 'true') {
            sessionStorage.clear();
            alert('¡Sesion bloqueada!');
            this.setState({ login: false });
        }
    }


    leer() {
        try {
            let valor1 = document.getElementById('filtro').value;
            document.getElementById('sol_ine').value = valor1;
        } catch (e) {
            console.log(e);
        }
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
        const listItems = this.state.solicitud.map((i) =>
            <ItemList 
                key=                {i.ine + Math.random() * (max - min) + min} 
                number=             {++indice}
                alias=              {i.alias}
                name=               {i.nombre} 
                amount=             {i.monto} 
                amountDescription=  "Pago del día:"
                stateItem=          {i.id_estado_solicitud} 
                 
                close=              {true} 
                />
        );

        /*<ItemList 

            modal=              {true} 
            -- number=             "1" 
            -- alias=              "Pozolera" 
            -- name=               "Alicia Ocaña Vazquez" 
            -- amount=             "550.00" 
            -- amountDescription=  "Pago del día:" 
            stateItem=          {1} 
            stateDescription=   "Pagó completo" 

        />*/
        return (
            <div>
                <NavbarExtends title="Cobrar" label1="A recaudar" label2="$90,350" />
                <div className="container-fluid">
                    <div className="row Cobrar">
                        <Title />
                        <ComboBox id="filtro" label="Filtrar" items={JSON.stringify({ lista: ["opcion1", "opcion2"] })} />
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