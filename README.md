# AP Capital Assessment (UniSwapper)
This assessment was done using Solidity, Truffle, and tested on the Kovan testnet. 

## Setup

Register an Infura account at Infura.io and create a new project. Copy the Project ID value and the private key of your account to ```INFURA_API_KEY``` and ```DEPLOYMENT_ACCOUNT_KEY``` in the .env file. 

Install all dependencies

```
npm install
```

## Network deployment
Connect to the network you wish to deploy to. In this case, I tested all contracts with Kovan.
```
truffle console --network kovan
```
Compile and deploy contracts
```
migrate --reset
```
## Calling Uniswapper
Call ```swap()``` function with the address of ```TOKEN_A```, the token you wish to convert from, and the address of ```TOKEN_B```, the token you wish to convert to. ```AMOUNT``` of ```TOKEN_A``` will be converted to the max amount possible of ```TOKEN_B```.
```
let u = await UniSwapper.deployed()
await u.swap(AMOUNT, TOKEN_A, TOKEN_B)
```