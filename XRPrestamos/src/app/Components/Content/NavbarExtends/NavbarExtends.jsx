import React, { Component } from 'react';

import {Btn} from '../../Form/Btn/Btn.jsx';

import './NavbarExtends.css';

//PROPIEDADES ------------------------------
//setLogo | setTitle | setDate

class NavbarExtends extends Component {

    constructor(props) {
        super(props);

    }

    render() {
        return (
            <div className="container-fluid bg-dark text-white">
                <div className="row">
                    <div className="col ml-n3">
                        <div className="col-12">
                            A
                        </div>
                        <div className="col-12">
                            B
                        </div>
                    </div>
                    <div className="col-auto navbarextends_button p-0 m-1">
                        <Btn />
                    </div>
                </div>
            </div>
        );
    }
}

export default NavbarExtends;