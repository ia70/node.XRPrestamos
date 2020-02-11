import React, { Component } from 'react';

import { Btn } from '../../Form/Btn/Btn.jsx.js.js.js';

import './NavbarExtends.css';

//PROPIEDADES ------------------------------
// label1, label2, title

class NavbarExtends extends Component {

    constructor(props) {
        super(props);

    }

    render() {
        return (
            <div className="container-fluid bg-dark text-white">
                <div className="row align-items-center">
                    <div className="col align-items-center p-0">
                        <div className="col align-items-center p-0">
                            <h6 className="navbarextends_label1 m-0 col-10 col-sm-4 col-md-3 col-lg-2">{this.props.label1}</h6>
                        </div>
                        <div className="w-100"></div>
                        <div className="col align-items-center p-0">
                            <h6 className="navbarextends_label2 m-0 col-10 col-sm-4 col-md-3 col-lg-2">{this.props.label2}</h6>
                        </div>
                    </div>
                    <div className="align-items-center col-6 col-sm-4 col-md-3 col-lg-2 p-0 m-0">
                        <div className="row align-items-center m-0">
                            <div className="col p-0 align-items-center m-0">
                                <h3>{this.props.title}</h3>
                            </div>
                            <div className="col-auto navbarextends_button p-0 m-1">
                                <Btn url={this.props.url || "/dashboard"}/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default NavbarExtends;