import React, { Component } from 'react';

import {GetDate} from '../../utils/GetDate/index.jsx';

import './Navbar.css';

//PROPIEDADES ------------------------------
//setLogo | setTitle | setDate

class Navbar extends Component {

    constructor(props) {
        super(props);

    }

    render() {
        let Fecha = "";

        if(this.props.setDate){
            Fecha = GetDate();
        }

        return (
            <nav className="navbar navbar-dark bg-dark nav_noborder" >
                <div className="navbar-brand" >
                    <img src={this.props.setLogo} width="30" height="30" className="d-inline-block align-top nav_margin" alt="" ></img>
                    {this.props.setTitle}
                </div>
                <div className="nav_color align-middle">
                        {Fecha}
                        <button className="btn btn-warning" >X</button>
                </div>
            </nav>
        );
    }
}

export default Navbar;