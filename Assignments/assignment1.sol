// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract assignment1
{

    
    function add(uint16 num1, uint16 num2) public pure returns (uint16) {
        return num1+num2;
    }
    function sub(uint16 num1, uint16 num2) public pure returns (uint16) {
        return num1-num2;
    }
    function mul(uint16 num1, uint16 num2) public pure returns (uint16) {
        return num1*num2;
    }
    function divide(uint16 num1, uint16 num2) public pure returns (uint16) {
        return num1/num2;
    }
}