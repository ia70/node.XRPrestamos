// DEPENDENCIES -------------------------------------------------------
import React from "react";
import {
    BrowserRouter as Router,
    Switch,
    Route,
    Link
} from "react-router-dom";

// COMPONENTS ---------------------------------------------------------
import Dashboard from './Views/Cobrador/Dashboard/Dashboard.jsx';
import CarteraClientes from './Views/Cobrador/CarteraClientes/CarteraClientes.jsx';
import Cobrar from './Views/Cobrador/Cobrar/Cobrar.jsx';
import EstadoSolicitud from './Views/Cobrador/EstadoSolicitud/EstadoSolicitud.jsx';
import SolicitarDinero from './Views/Cobrador/SolicitarDinero/SolicitarDinero.jsx';
import NuevoCliente from './Views/NuevoCliente/NuevoCliente.jsx';
import Login from './Views/Login/Login.jsx';





export default function App() {
    return (
        <Router>
                <Switch>
                    <Route path="/carteraclientes" component={CarteraClientes} />
                    <Route path="/cobrar" component={Cobrar} />
                    <Route path="/estadosolicitud" component={EstadoSolicitud} />
                    <Route path="/solicitardinero" component={SolicitarDinero} />
                    <Route path="/nuevocliente" component={NuevoCliente} />
                    <Route path={["/", "/Dashboard"]} component={Dashboard} />
                </Switch>
        </Router>
    );
}