// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract invenvtorymanager{
    uint256 stock;
    address owner;
    address[] public purchaser;
    mapping(address => uint256) public balances;

    constructor(){
        owner = msg.sender;
        stock = 20;
    }

    function transfer(address reciver, uint256 purchaseStock) public payable returns (bool) {
        require(msg.value >= 1 ether,"error balance not found");
        stock -= purchaseStock;
        purchaser.push(reciver);
        return true;
    }


}