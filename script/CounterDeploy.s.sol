// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";


// source .env
// forge script script/CounterDeploy.s.sol --rpc-url $RINKEBY_URL  --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY -vvvv

contract DeployScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();

        // Counter counter = new Counter();

        vm.stopBroadcast();
    }
}
