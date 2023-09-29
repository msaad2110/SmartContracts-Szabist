// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract lecture2
{
    uint8 num;
    string name;
    bool val;
    address payable add;
    address payable public owner;

    constructor(){
        owner=payable(msg.sender);
    }



    function setNum(uint8 _num) public{
        num = _num;
    }

    function getNum() public view returns (uint8) {
        return num;
    }

    function setName(string memory _name) public{
        name = _name;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function setVal(bool _val) public{
        val = _val;
    }

    function getVal() public view returns (bool) {
        return val;
    }
    function setAdd(address _add) public{
        add = payable(_add);
    }
    function getAdd() public view returns (address) {
        return add;
    }
    


}