# Solidity-ETH-Transfer
— You can either transfer ( 2300 gas, throws error), send (2300 gas, returns bool) or call (forward all gas or set gas, returns bool). When do you choose which of the two above? — receive() is called whenever msg. data is empty, otherwise fallback() will be called.
