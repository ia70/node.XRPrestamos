import React, { Component } from 'react';

import { Image } from 'react-bootstrap';
import '../css/BtnRounded.css';

class BtnRounded extends Component {
    render() {
        return (
            <div className="Cont m-1 p-1 btn btn-outline-info" onClick={() => this.props.event(this.props.id)} >
                <Image src={this.props.src} roundedCircle className="border border-warning Cont2" />
                <strong className="text-center Cont2" >{this.props.texto}</strong>
            </div>
        );
    }
}

export default BtnRounded;