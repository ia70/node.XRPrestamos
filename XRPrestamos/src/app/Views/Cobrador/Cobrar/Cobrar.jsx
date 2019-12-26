import React, { Component } from 'react';

//CONMPONENTS --------------------------------------------------
import NavbarExtends from '../../../Components/Content/NavbarExtends/NavbarExtends.jsx';
import { ItemList } from '../../../Components/Custom/ItemList/ItemList.jsx';
import { Title } from '../../../Components/Content/Title/Title.jsx';
import { TextSearch } from '../../../Components/Form/TextSearch/TextSearch.jsx';

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
                    <div className="row">
                        <Title />
                        <TextSearch />
                    </div>
                    <div className="row" >

                        <ItemList number="1" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="550.00" amountDescription="Monto solicitado:" />
                        <ItemList number="2" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <ItemList number="3" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <ItemList number="4" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <ItemList number="20" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />
                        <ItemList number="220" alias="Pozolera" name="Alicia Ocaña Vazquez" amount="1,500" amountDescription="Monto solicitado:" />


                    </div>
                </div>
            </div>
        );
    }
}

export default Cobrar;