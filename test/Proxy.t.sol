// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import {Counter} from "../src/Counter.sol";
import {Proxy} from "../src/Proxy.sol";

contract ContractTest is Test {

    Counter internal counter;
    Proxy internal proxy;

    function setUp() public {

    counter = new Counter();

    bytes memory initializerData = abi.encodeWithSignature('initialize()', "");
    proxy = new Proxy(initializerData, address(counter));


    }

    function testIncrement() public {
        (bool success, ) = address(proxy).delegatecall(abi.encode("increment()"));
        assertEq(success, true);

        (bool success1, bytes memory returnData) = address(proxy).delegatecall(abi.encode("count()"));
        assertEq(success1, true);
        emit logs(returnData);
    }

    function testUpgradeFail() public {
        vm.expectRevert(bytes("Ownable: caller is not the owner"));
        vm.prank(address(0));
        pizza.upgradeTo(address(pizzaV2));
    }
}
