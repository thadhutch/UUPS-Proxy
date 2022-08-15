#! source script/deploy/DeployVerifyPizza.sh

if [ -f .env ]
then
  export $(cat .env | xargs)
else
    echo "Please set your .env file"
    exit 1
fi

forge create ./src/Pizza.sol:Pizza -i --rpc-url ${RINKEBY_URL} --private-key ${PRIVATE_KEY} --verify