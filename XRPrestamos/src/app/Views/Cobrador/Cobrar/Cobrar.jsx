import React, { Component } from 'react';

//CONMPONENTS --------------------------------------------------
import NavbarExtends from '../../../Components/Content/NavbarExtends/NavbarExtends.jsx';
import { ItemList } from '../../../Components/Custom/ItemList/ItemList.jsx';
import { Title } from '../../../Components/Content/Title/Title.jsx';

import Logo from '../../../img/Logo.png';


class Cobrar extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div>
                <NavbarExtends setLogo={Logo} setTitle="A recaudar:" />
                <div className="container">
                    <div className="row" >
                        <Title />

                        <ItemList number="1"  alias="Pozolera" name="Alicia Ocaña Vazquez" amount="500,000.50" amountDescription="Monto solicitado:" />
                        <ItemList number="2"  alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <ItemList number="3"  alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <ItemList number="4"  alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <ItemList number="5"  alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <ItemList number="6"  alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />

                    </div>
                </div>
            </div>
        );
    }
}

export default Cobrar;