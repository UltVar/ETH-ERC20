# ETH-ERC20

# Description
This project shows ERC20 tokens and its various functions and commands. Here, it will show ERC20's _mint, _burn, and _transfer functions, as well as the inheritance of the project from the OpenZepplin ERC20 contract. It was made and compiled in remix.ethereum.org.

# Inheritance of OpenZepplin
The project inherits the OpenZepplin ERC20 solana code which includes all ERC20 functions. It was inherited via importing the github link and calling the function with "_[function name]".
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
```

# OnlyOwner Modifier in Mint
The OnlyOwner modifier was made so that the only account or address accessing the account is the Contract Owner's address. It was placed in the minting function to ensure that only the owner can mint.

# Burning and Transferring
The burn function is used for burning the value of the address, and accepts the address to be burned and the value to burn. The transfer function transfers a value from the sender's address to the recipient's address, accepting two addresses and a value as its parameters.

# Source Code
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract Mtoken is ERC20 {

    address public owner;

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(msg.sender, 100 * 10**uint(decimals()));
        owner = msg.sender;
    }

    modifier OnlyOwner(){
        require(msg.sender == owner, "Only the owner of this contract may call this function");
        _;
    }

    function minting(address _address, uint _value) external OnlyOwner{
        _mint(_address, _value);
    }

    function burning(address _address, uint _value) public{
        _burn(_address, _value);
    }

    function transfering(address _fromaddress, address _toaddress, uint _value) public{
        _transfer(_fromaddress, _toaddress, _value);
    }
}
```

# Video Presentation
Here is a video presentation demonstrating the project in Loom: https://www.loom.com/share/4b1056205db64e0c80494d28a8e872c1?sid=53ad34bb-2e0e-4add-8bb7-771090bff36a
