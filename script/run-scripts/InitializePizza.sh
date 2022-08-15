#! source script/run-scripts/InitializePizza.sh

if [ -f .env ]
then
  export $(cat .env | xargs)
else
    echo "Please set your .env file"
    exit 1
fi

forge script script/InitializePizzaInProxy.s.sol --rpc-url $RINKEBY_URL  --private-key $PRIVATE_KEY --broadcast -vvvv