// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract HotelBooking{
    bool isBooked;

    struct customerInfo
    {
        address customer;
        uint256 _days;
    }
    customerInfo _customer;

    function booking(uint8 bookedDays) public  {
        _customer.customer = msg.sender;
        _customer._days = bookedDays;
    }
    function getInfo() public view returns(customerInfo memory){
        return _customer;
    }
}

contract Balance{
    constructor(){ }

    modifier checkValue(){
        require(msg.value >= 1 ether, "error");
        _;
    }
    mapping(address => uint256) public balances;


    
    // function setBalance() public payable checkValue{
        
    //     balances[payable(msg.sender)] = msg.value;
    // }
    event balanceIsSet(address);
    function setBalance() public payable checkValue{
        
        balances[payable(msg.sender)] = msg.value;
        emit balanceIsSet(msg.sender);
        
    }

    function getBalanceOfThis() public view returns (uint256){
        return balances[address(this)];
    }

    function setBalanceForWallet(address wallet, uint256 amount) public {
        require(amount >= 100, "low balance");
        require(wallet != address(0), "zero address detected");

        balances[wallet] = amount;
    }

    function addBalance(address wallet) public{
        balances[wallet] += 100;
    }

    function transfer(address sender, address reciver, uint256 amount) public returns (bool) {
        balances[reciver] -= amount;
        balances[sender] += amount;
        return true;
    }
}