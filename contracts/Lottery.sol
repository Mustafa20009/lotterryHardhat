// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
error notEnough();

contract Lottery {
    uint256 private immutable s_enteranceFee;
    address payable[] private Players;

    constructor(uint256 enterFee) {
        s_enteranceFee = enterFee;
    }

    function EnterRaffle() public payable {
        if (msg.value > s_enteranceFee) {
            revert notEnough();
        }
        Players.push(payable(msg.sender));
    }

    function getEnteranceFee() public view returns (uint256) {
        return s_enteranceFee;
    }

    function getPlayer(uint256 index) public view returns (address) {
        return Players[index];
    }
}
