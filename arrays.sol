// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract array {
    uint256[] public arr; //array vacio
    uint256[] public arr2 = [22, 33, 44]; // array con elementos
    uint256 [10] public arr3; //array vacio pero con tamaño definido

    //devuelve el elemento de la posición del array 
    function getNum(uint _i) public view returns (uint256) { 
        return arr2[_i]; 
    }

    //trae el elemento array completo 
    function getArray() public view returns (uint256[] memory) {
        return arr2;
    }  

    //colocar un nuevo elemento en el array
    function push(uint256 _i) public {
        arr2.push(_i);
    }

    //borra el último elemento del array
    function pop() public {
        arr2.pop();
    }

    //contar el número de elementos que tiene el array
    function getLength() public view returns (uint256) {
        return arr2.length;
    }

    //eliminar un elemento en particular del array
    function remove(uint256 _index) public {
        delete arr2[_index];
    }
}