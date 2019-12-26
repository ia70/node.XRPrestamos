import React, { Component } from 'react';

import { GetDate } from '../../utils/GetDate/GetDate.jsx';

import './NavbarExtends.css';

//PROPIEDADES ------------------------------
//setLogo | setTitle | setDate

class NavbarExtends extends Component {

    constructor(props) {
        super(props);

    }

    render() {
        let Fecha = "";

        if (this.props.setDate) {
            Fecha = GetDate();
        }

        return (
            <nav className="navbar navbar-dark bg-dark navextends_noborder navextends" >
                <div className="container-fluid">
                        <div className="col">
                            <div className="row">
                                A
                            </div>
                            <div className="row">
                                B
                            </div>
                        </div>
                        <div className="col-1">
                            A
                        </div>
                </div>
            </nav>
        );
    }
}

export default NavbarExtends;