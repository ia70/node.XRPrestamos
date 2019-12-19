import React, { Component } from 'react';

import { Image } from 'react-bootstrap';
import { Container } from 'react-bootstrap';
import { Row } from 'react-bootstrap';
import { Col } from 'react-bootstrap';
import CarteraClientes from '../../Components/img/CarteraClientes.png';


class Dashboard extends Component {
    constructor() {
        super();
        this.state = {
            title: "Mi aplicación",
            tareas: 10
        }
    }

    render() {
        return (
            <Container>
                <Row>
                    <Col xs={6} md={4}>
                        <Image src={CarteraClientes} rounded />
                    </Col>
                    <Col xs={6} md={4}>
                        <Image src={CarteraClientes} roundedCircle />
                    </Col>
                    <Col xs={6} md={4}>
                        <Image src={CarteraClientes} thumbnail />
                    </Col>
                </Row>
            </Container>
        )
    }
}

export default Dashboard;