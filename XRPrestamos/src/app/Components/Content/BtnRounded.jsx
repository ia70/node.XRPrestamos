import React, { Component } from 'react';

import { Image } from 'react-bootstrap';
import '../../Views/css/BtnRounded.css';

class BtnRounded extends Component {
    constructor() {
        super();

    }

    render() {
        return (
            <div className="Cont m-2">
                <Image src={this.props.src} roundedCircle className="border border-info Cont2" />
                <strong className="text-center Cont2" >{this.props.texto}</strong>
            </div>
        );
    }
}

export default BtnRounded;