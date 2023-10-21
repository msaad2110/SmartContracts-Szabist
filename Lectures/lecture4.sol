// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Practice{
    address owner;
    address[] public addressList;
    mapping(address => uint256) public balances;
    mapping(address => mapping(uint => uint256)) balancenew;


    constructor(){
        owner = msg.sender;
        balances[owner] = 100;
        
    }

    receive() external payable {
        require(msg.value >= 1 ether,"error");
        setBalance();
    }
//0x9bF88fAe8CF8BaB76041c1db6467E7b37b977dD7
    function setBalance() internal {
        balancenew[msg.sender][block.timestamp] = 10000; 
    }
    
    function print() public pure returns (string memory) {
        return "Hello Solidity";
    }

    event balanceisTransfered(string message);
    function transfer(address reciver, uint256 amount) public returns (bool) {
        require(balances[owner] > amount, "account balance not sufficient");
        balances[owner] -= amount;
        balances[reciver] += amount;
        addressList.push(reciver);
        emit balanceisTransfered("Balance has been transferred!");
        return true;
    }

    function getAddressAt(uint256 index) public view returns (address) {
        return addressList[index];
    }
}