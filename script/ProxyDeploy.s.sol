// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";


// source .env
// forge script script/ProxyDeploy.s.sol --rpc-url $RINKEBY_URL  --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY -vvvv

contract DeployScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();

        // bytes memory initializerData = abi.encodeWithSignature('initialize()', "");

        // Proxy proxy = new Proxy(initializerData, address(0xD5eBD12aeEb0Ef8050BCba822314a00CB7B1ED07));

        vm.stopBroadcast();
    }
}
