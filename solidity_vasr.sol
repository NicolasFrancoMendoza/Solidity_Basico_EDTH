// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract solidity_vars {
    address public block_now;   // dirección del minero actual
    uint public block_diff;     // dificultad del bloque actual
    uint public block_num;      // número de bloque actual
    bytes32 public block_hash;  // ELIMINADO EN LA CLASE: tipo de dato para el block hash
    uint public time_stamp;     // marca el tiempo de la cadena de blouqes
    uint public gas_left;       // gas left
    address public sender;      // dirección de quien está realizando la llamada del contrado
    bytes4 public sig_id;       // primeros 4 bytes de la llamada a la función   
    uint public gas_limit;      // limite de gas del bloque actual

    function updateParams() public {
        block_now = block.coinbase;
        block_diff = block.prevrandao;
        block_num = block.number;
        time_stamp = block.timestamp;
        gas_left = gasleft();
        sender = msg.sender;
        sig_id = msg.sig;
        gas_limit = block.gaslimit;
    }
}