// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract hola_mundo_dinamico {
    string Saludo_d = "Hola mundo dinamico"; //saludo dinámico
    string public Saludo_e = "Hola mundo inicial en el despliegue"; //saludo estático 

    function leerSaludo () public view returns (string memory) { 
        //function: es lo q se va a hacer, view: significa q solo es para ver, es decir no genera cambio en la blockchain,
        //returns: significa que va a retornar el saludo dináco, memory: va a ocupar un espacio de memoria
        return Saludo_d;
    }

    function guardarSaludo (string memory _nuevoSaludo) public {
        Saludo_d = _nuevoSaludo;
    }  
}