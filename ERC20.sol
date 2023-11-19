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