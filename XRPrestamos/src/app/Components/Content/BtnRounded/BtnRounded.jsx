import React, { Component } from 'react';

import './BtnRounded.css';

class BtnRounded extends Component {
    render() {
        return (
            <div className="col m-1 p-1 btn btn-outline-info" onClick={() => this.props.event(this.props.id)} >
                <div className="row">
                    <div className="col-12">
                        <img src={this.props.src} className="border border-warning rounded-circle" />
                    </div>
                    <div className="col-12">
                        <strong className="text-center" >{this.props.texto}</strong>
                    </div>
                </div>
            </div>
        );
    }
}

export default BtnRounded;