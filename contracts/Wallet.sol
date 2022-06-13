//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Wallet {
    mapping(address => uint256) Wallets;

    function withdrawMoney(address payable _to, uint256 _amount) external {
        require(_amount <= Wallets[msg.sender], "Not enough fund");
        Wallets[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    function getBalance() external view returns (uint256) {
        return Wallets[msg.sender];
    }

    receive() external payable {
        Wallets[msg.sender] += msg.value;
    }

    fallback() external payable {}
}
