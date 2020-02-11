import React, { Component } from 'react';

import {Btn} from '../../Form/Btn/Btn.jsx.js.js.js';
import {GetDate} from '../../utils/GetDate/GetDate.jsx.js.js.js';

import './Navbar.css';

//PROPIEDADES ------------------------------
//setLogo | setTitle | setDate | url

class Navbar extends Component {

    constructor(props) {
        super(props);

    }

    render() {
        let Fecha = "";
        let Boton = <Btn url={this.props.url || "/dashboard"}/>;

        if(this.props.setButton != null){
            Boton="";
        }

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
                        {Boton}
                </div>
            </nav>
        );
    }
}

export default Navbar;