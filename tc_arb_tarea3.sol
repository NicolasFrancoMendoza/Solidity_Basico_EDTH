// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract tb_arb {
     
     //determinar la dirección de la billetera que crea el contrato
     address payable public owner; //payable: la variable q está definiendo va a recibir dinero

        struct Data {
            string date;            //fecha de envio
            string delivery_date;   //fecha estimada de entrega
            string product;         //nombre producto
            string price;           //precio del producto
            string code;            //identificador del proveedor
            string cel_number;      //contacto de la persona que compró el producto
            int8 status;            // 1- en camino, 2- llego al país, 3- está en la aduana y 4- entregado
            address wallet;         //persona que ejecutó el contrato
        }

        Data public data;

        event newData (
            string date,          
            string delivery_date,   
            string product,         
            string price,           
            string code,            
            string cel_number,      
            int8 status,            
            address wallet
        );

        //modifier para que solo el owner ueda retirar los fondos del contrato
        modifier onlyOwner() {
            require(msg.sender == owner, "Solo el propietario pueda retirar los fondos");
            _;
        }

        /*modifier lo que hace es verificar dentro de otroas funciones que al ejecutrar 
        la función no se tenga el valor del fee + el gas
        */
        modifier cost(uint amount) {
            require(msg.value >= amount, "No tiene salgo en ARB para ejecutar");
            _;
        }

        //se define quien es el propietario del contrato
        constructor() {
            owner = payable(msg.sender);
        }

        //función para cambiar los datos del menú
        function pushData(  string memory _date,
                            string memory _delivery_date,
                            string memory _product,
                            string memory _price,
                            string memory _code,
                            string memory _cel_number,
                            int8 _status)  public payable cost(1000000000000000){
            data = Data(_date,
                        _delivery_date,
                        _product,
                        _price,
                        _code,
                        _cel_number,
                        _status,
                        msg.sender);

            //es como una especie de log
            emit newData(_date,
                         _delivery_date,
                         _product,
                         _price,
                         _code,
                         _cel_number,
                         _status,
                         msg.sender);
            }
        
        //funcion para retir los fondos del contrato
        function withdraw() public onlyOwner {
            uint balance = address(this).balance;
            require(balance > 0, "No se tienen fondos en el contrato todavia");
            owner.transfer(balance);
        }

        // funcion para consultar el valor que se encuentra en el contrato
        function getBalance() public view returns (uint256) {
            return address(this).balance;
}

}