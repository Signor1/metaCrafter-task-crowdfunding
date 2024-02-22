// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Crowdfunding {
    address public organizer;

    mapping(address => uint) public contributions;

    uint public totalFunds;
    uint public deadline;
    bool public campaignEnded;

    address[] public contributors;

    constructor(uint _durationInDays) {
        organizer = msg.sender;
        deadline = block.timestamp + (_durationInDays * 1 days);
    }
}
