// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Voting{
    mapping(string => uint) public votes;

    function addvotes(string memory nomi) public{
        votes[nomi]++;
    }
    
}