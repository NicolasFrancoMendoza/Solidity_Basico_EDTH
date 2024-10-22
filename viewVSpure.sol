// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract viewVSpure {
    uint public x = 10;

    function sumaView(uint y) public view returns (uint) {
        return x + y;
    }

    function sumaPure(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}