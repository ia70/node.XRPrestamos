import React, { Component } from 'react';



class Navbar extends Component {

    constructor(props){
        super(props);

    }

    render() {
        return (
            <nav className="navbar navbar-dark bg-dark" >
                <div className="navbar-brand" >
                    <img src={this.props.setLogo} width="30" height="30" className="d-inline-block align-top" alt="" ></img>
                    Bootstrap
                </div>
            </nav>
        );
    }
}

export default Navbar;