#! source script/run-scripts/ProxyUpgrade.sh

if [ -f .env ]
then
  export $(cat .env | xargs)
else
    echo "Please set your .env file"
    exit 1
fi

forge script script/ProxyUpgrade.s.sol --rpc-url $RINKEBY_URL  --private-key $PRIVATE_KEY --broadcast -vvvv