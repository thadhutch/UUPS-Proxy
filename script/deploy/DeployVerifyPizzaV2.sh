#! source script/deploy/DeployVerifyPizzaV2.sh

if [ -f .env ]
then
  export $(cat .env | xargs)
else
    echo "Please set your .env file"
    exit 1
fi

forge create ./src/PizzaV2.sol:PizzaV2 -i --rpc-url ${RINKEBY_URL} --private-key ${PRIVATE_KEY} --verify