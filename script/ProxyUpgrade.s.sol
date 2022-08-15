// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import {Pizza} from "../src/Pizza.sol";
import {PizzaV2} from "../src/PizzaV2.sol";

contract DeployScript is Script {

    Pizza internal pizza;
    PizzaV2 internal pizzaV2;

    address internal proxy = 0x2D3928d6E78dEfB366c01208b6b1Ba07998B38d4;
    address internal pizzaV2Address = 0xcbCf82CF306827eFf97AFEeddF3bf4Cb9CD913AD;

    event log_uint (uint);

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        pizza = Pizza(address(proxy));
        uint sliceCount = pizza.slices();
        emit log_uint(sliceCount);

        pizza.upgradeTo(address(pizzaV2Address));
        pizzaV2 = PizzaV2(address(proxy));
        pizzaV2.refillSlice();

        uint v2SliceCount = pizzaV2.slices();
        emit log_uint(v2SliceCount);

        vm.stopBroadcast();
    }
}
