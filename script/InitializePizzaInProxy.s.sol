// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import {ERC1967Proxy} from "openzeppelin/proxy/ERC1967/ERC1967Proxy.sol";

import {Pizza} from "../src/Pizza.sol";

contract DeployScript is Script {

    Pizza internal pizza;

    address internal proxy = 0x2D3928d6E78dEfB366c01208b6b1Ba07998B38d4;

    function setUp() public {}

    function run() public {
        vm.broadcast();

        pizza = Pizza(address(proxy));
        pizza.initialize(8);

        vm.stopBroadcast();
    }
}
