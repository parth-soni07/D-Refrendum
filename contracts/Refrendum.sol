// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Referendum {
    address public owner;
    string public question;
    mapping(address => bool) public hasVoted;
    uint256 public yesVotes;
    uint256 public noVotes;
    bool public isOpen;

    event Voted(address indexed voter, bool choice);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }
                                                                                
    modifier onlyWhenOpen() {
        require(isOpen, "Referendum is not open for voting");
        _;
    }

    constructor(string memory _question) {
        owner = msg.sender;
        question = _question;
        isOpen = true;
    }

    function vote(bool _choice) external onlyWhenOpen {
        require(!hasVoted[msg.sender], "You have already voted");
        hasVoted[msg.sender] = true;

        if (_choice) {
            yesVotes++;
        } else {
            noVotes++;
        }

        emit Voted(msg.sender, _choice);
    }

    function closeReferendum() external onlyOwner {
        isOpen = false;
    }
}
