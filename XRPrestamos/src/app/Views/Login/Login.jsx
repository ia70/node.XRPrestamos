import React, { Component } from 'react';

import './Login.css';

//PROPIEDADES ------------------------------
//setLogo | setTitle | setDate

class Login extends Component {

    constructor(props) {
        super(props);

    }

    render() {

        return (
            <div className="d-flex login">
                <h4>Login</h4>
            </div>
        );
    }
}

export default Login;