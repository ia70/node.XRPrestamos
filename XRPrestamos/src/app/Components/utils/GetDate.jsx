import React from 'react';

function GetDate(){
    let date = new Date()

    let day = date.getDate()
    let month = date.getMonth() + 1
    let year = date.getFullYear()

    let fecha = "";
    
    if(month < 10){
        fecha = day + '0\/' + month + '\/' + year
    }else{
        fecha = day + '\/' + month + '\/' + year
    }

    return(
        fecha
    );
}

export default GetDate;