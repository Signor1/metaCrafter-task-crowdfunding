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

    function finalizeCampaign() public {
        //only the organiser can call this function
        require(
            msg.sender == organizer,
            "Only the organizer can finalize the campaign"
        );
        //checking if the funding has ended
        require(
            block.timestamp >= deadline,
            "The campaign deadline has not been reached yet"
        );
        //checking if the whole campaign for fund raising has ended
        require(!campaignEnded, "The campaign has already been finalized");

        if (checkGoalReached(100 ether)) {
            if (payable(organizer).send(totalFunds)) {
                campaignEnded = true;
            } else {
                revert("Failed to transfer funds to the organizer");
            }
        } else {
            for (uint i = 0; i < contributors.length; i++) {
                address payable contributor = payable(contributors[i]);
                uint amount = contributions[contributor];
                if (amount > 0) {
                    if (contributor.send(amount)) {
                        totalFunds -= amount;
                        contributions[contributor] = 0;
                    } else {
                        revert("Failed to refund a contributor");
                    }
                }
            }
            campaignEnded = true;
        }
    }
}
