// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./Proxiable.sol";

contract Counter is Proxiable {

    address public owner;
    uint public count;
    bool public initialized = false;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    function initialize() public {
        require(owner == address(0), "Already initialized");
        require(!initialized, "Already initialized");

        owner = msg.sender;
        initialized = true;
    }

    /*
        Whenever we upgrade a smart contract we need to make sure that we dont change the order
        of the declared variables. This is because they will take that storage slot in the new contract
        upon creation. We can always add more variables.
    */

    function updateCode(address newCode) onlyOwner public {
        updateCodeAddress(newCode);
    }

    function increment() public {
        count ++;
    }
}