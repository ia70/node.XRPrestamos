import React, { Component } from 'react';

import './BtnRounded.css';

class BtnRounded extends Component {
    render() {
        return (
            <div className="Cont m-1 p-1 btn btn-outline-info" onClick={() => this.props.event(this.props.id)} >
                <img src={this.props.src} className="border border-warning Cont2 rounded-circle" />
                <strong className="text-center Cont2" >{this.props.texto}</strong>
            </div>
        );
    }
}

export default BtnRounded;