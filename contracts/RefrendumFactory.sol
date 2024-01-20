// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Refrendum.sol";

contract ReferendumFactory {
    address[] public referendums;

    event ReferendumCreated(address indexed referendumAddress, string question);

    function createReferendum(string memory _question) external {
        Referendum newReferendum = new Referendum(_question);
        referendums.push(address(newReferendum));
        emit ReferendumCreated(address(newReferendum), _question);
    }

    function getReferendums() external view returns (address[] memory) {
        return referendums;
    }
}
