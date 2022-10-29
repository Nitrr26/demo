//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;

contract Seller{
    constructor() {

    }

    struct Product {
        uint id;
        string productName;
        address productManufacturer;
        address productOwner;
        uint productQuantity;
        address fromPath;
        address[] toPath;
        string qrCode;
    }

    mapping (uint => Product) public productStructs; //information about the products
    uint[] private productList; // the products' ids
    uint private productCount = 1; // to keep track of the products ids

    
    function getLength() public view returns(uint){
        return productList.length;
    }


    function insertProduct(string memory _productName, uint _productQuantity) public returns(uint) {
        require(msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        productStructs[productCount].productName = _productName;
        productStructs[productCount].productOwner = msg.sender;
        productStructs[productCount].productManufacturer = msg.sender;
        productStructs[productCount].productQuantity = _productQuantity;
        // productStructs[productCount].fromPath
        // productStructs[productCount].toPath = new address[](16);
        productList.push(productCount);

        productStructs[productCount].id = productList.length - 1;
        productCount = productCount + 1;  
        return productList.length;
    }

    function sendProduct(uint _productId) public{
        for(uint i=0; i<productStructs[_productId].toPath.length; i++){
            require(productStructs[_productId].productOwner == msg.sender);
            productStructs[_productId].productOwner = productStructs[_productId].toPath[i];
        }
        // return productStructs[_productId].productOwner;
    } 

}

contract Buyer is Seller{
    function checkOwner(uint _productId) public view returns(address){
        return productStructs[_productId].productOwner;
    }

    // function checkProduct(uint _productId, string memory _qrCode) public pure returns(bool){
    //     require(productStructs[_productId].qrCode = _qrCode);
    //     return true;
    // }

    function buyProduct(uint _productId) public {
        // require(checkProduct(_productId));
        productStructs[_productId].toPath.push(msg.sender);
    }
}