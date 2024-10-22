// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Mapping { //se usó mayusculas al comienzo porque se confunde con la función "mapping"
    //definir un mapping de direcciones y enteros
    mapping(address => uint256) balances;

    //función para establecer el balance en el mapping
    function setBalance(address _addr) public {
        uint256 arbBalance = _addr.balance; //consulta el balance
        balances[_addr] = arbBalance; //asigna el balance consultado
    }

    //función q consulta el valor del balance de una dirección en particular
    function getBalance(address _addr) public view returns(uint256) {
        return balances[_addr];
    }

    //función me permite eliminar el valor que desee del mapping
    function removeBalance(address _addr) public {
        delete balances[_addr];
    }

    //función q llama a otra función para actualizar los balances de un mapping
    function  updateBalanceArb(address _addr) public {
        setBalance(_addr);
    }

}