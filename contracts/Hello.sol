// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract SimpleStorage{
    uint public storedData;

// public shows that everyone access from outside
    function set(uint x) public{
        storedData = x;
    } 

// View shows that never change the contract flow
    function get() public view returns(uint) {
        return storedData;
    }
}


