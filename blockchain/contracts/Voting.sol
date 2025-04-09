// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Voter {
        bool voted;
        uint vote;
    }

    struct Candidate {
        string name;
        uint voteCount;
    }

    address public admin;
    mapping(address => Voter) public voters;
    Candidate[] public candidates;

    constructor(string[] memory candidateNames) {
        admin = msg.sender;
        for (uint i = 0; i < candidateNames.length; i++) {
            candidates.push(Candidate({
                name: candidateNames[i],
                voteCount: 0
            }));
        }
    }

    function vote(uint candidateId) public {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted, "Already voted.");
        require(candidateId < candidates.length, "Invalid candidate.");
        sender.voted = true;
        sender.vote = candidateId;
        candidates[candidateId].voteCount += 1;
    }

    function getResults() public view returns (Candidate[] memory) {
        return candidates;
    }
}
