// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract PersonContract {
    struct Person {
        uint id;
        string name;
    }

    mapping(uint => Person) private persons;
    uint private nextPersonId = 1;

    function storePerson(string memory _name) public {
        persons[nextPersonId] = Person(nextPersonId, _name);
        nextPersonId++;
    }

    function getPerson(uint _id) public view returns (uint, string memory) {
        Person memory person = persons[_id];
        return (person.id, person.name);
    }
}
