# Foundry UUPS example
Uses OpenZeppelin UUPS proxy pattern.
## Install
`forge install`

## Test
`forge test`

## Deploy and Verify
### .env
PIZZA_ADDRESS is necessary, when deploying ERC1967Proxy.sol.
Set PIZZA_ADDRESS, after deploying Pizza.sol

```
INFURA_API_KEY=*****
PRIVATE_KEY=*****
ETHERSCAN_API_KEY=*****
PIZZA_ADDRESS=*****
```
### Pizza.sol
`source script/DeployVerifyPizza.sh `
### ERC1967Proxy.sol
`source script/deploy/DeployVerifyProxy.sh`
### PizzaV2.sol
`source script/DeployVerifyPizzaV2.sh`

## Initialize and Upgrade

### Initialize
`source script/run-scripts/InitializePizza.sh`
### Upgrade
`source script/run-scripts/ProxyUpgrade.sh`

## Deployed Contracts

Proxy: `0x2D3928d6E78dEfB366c01208b6b1Ba07998B38d4`
Pizza: `0xf4cf9C1b549D2A2b9F1A2B9ea5af33f86b85Ced3`
PizzaV2: `0xcbCf82CF306827eFf97AFEeddF3bf4Cb9CD913AD`