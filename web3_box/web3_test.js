var Web3 = require('web3')

if (typeof web3 !== 'undefined') {
  web3 = new Web3(web3.currentProvider);
} else {
  // set the provider you want from Web3.providers
  web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
}

console.log(Web3);

console.log("currentProvider: ",web3.currentProvider)

// web3.eth.getBlock(9, function(error, result){
//     if(!error)
//         console.log(result)
//     else
//         console.error(error);
// })

var coinbase = web3.eth.coinbase;
console.log("coinbase: ", coinbase);

var balance = web3.eth.getBalance(coinbase);
console.log("balance: ", balance);