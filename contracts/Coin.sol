// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract Coin {
    // address also the data types in the solididty
    address public minter;


    // similar to dic in python compining two values
    mapping (address => uint) public balances;

    // 
    event sent(address from, address to, uint amount);


    constructor(){
        // return the wallet of the address
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        // it is the condition for the upcoming event
        require(amount <= balances[msg.sender],"You don't have that much money to transfer");

        // Max and min the amount from the balances
        balances[msg.sender] -= amount;
        balances[receiver] += amount;

        // calling the event
        emit sent(msg.sender,receiver,amount);

    }

}

// address - It is the public identity in the blockchain
// Mapping - Data type that used to store information similar to list but holding two values, allow to
            // get the value quickly using key
// Event - When you call the event it causes the argments to be stored in the transacation' log 
// Emit - that the keyword for the calling the Event
// Msg - allows us to access some special variables that are available for us from the blockchain
// Require - convenience functions in solidity
