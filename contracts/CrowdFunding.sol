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

    function contribute() external payable {
        //checking if the deadline has reached or passed
        require(
            block.timestamp < deadline,
            "The crowdfunding campaign has ended"
        );
        //ensuring that the amount is greater than 0
        assert(msg.value > 0);

        contributions[msg.sender] += msg.value;
        totalFunds += msg.value;
        contributors.push(msg.sender);
    }

    function checkGoalReached(uint fundingGoal) public view returns (bool) {
        return totalFunds >= fundingGoal;
    }
}
