// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Lock{
    uint256 public balance;
    struct ToDoList{
        string name;
        bool check;
    }
    mapping(uint => ToDoList) public toDoList;
    uint public listCount;

    function add(string memory _name) public{
        listCount += 1;
        toDoList[listCount] = ToDoList(_name, false);
    }

    function update(uint _listCount, bool _check) public {
        ToDoList storage toDoList = toDoList[_listCount];
        toDoList.check = _check;
    }



    

    function deposit(uint256 amount) public {
        balance += amount;
    }
}
