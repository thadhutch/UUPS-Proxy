// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import {Pizza} from "../src/Pizza.sol";
import {PizzaV2} from "../src/PizzaV2.sol";

import {ERC1967Proxy} from "openzeppelin/proxy/ERC1967/ERC1967Proxy.sol";

contract ProxyTest is Test {

    Pizza internal pizza;
    PizzaV2 internal pizzaV2;
    ERC1967Proxy internal proxy;

    function setUp() public {
        pizza = new Pizza();
        pizzaV2 = new PizzaV2();
        proxy = new ERC1967Proxy(address(pizza), "");
        pizza = Pizza(address(proxy));
        pizza.initialize(8);
        pizza.eatSlice();
    }

    function testEat() public {
        assertEq(pizza.slices(), 7);
    }

    function testUpgrade() public {
        pizza.upgradeTo(address(pizzaV2));
        pizzaV2 = PizzaV2(address(proxy));
        assertEq(pizzaV2.pizzaVersion(), 2);
        assertEq(pizzaV2.slices(), 7);
        pizzaV2.refillSlice();
        assertEq(pizzaV2.slices(), 8);
        pizzaV2.eatSlice();
        assertEq(pizzaV2.slices(), 7);
    }

    function testUpgradeFail() public {
        vm.expectRevert(bytes("Ownable: caller is not the owner"));
        vm.prank(address(0));
        pizza.upgradeTo(address(pizzaV2));
    }
}
