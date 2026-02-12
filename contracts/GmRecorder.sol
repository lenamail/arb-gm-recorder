// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract GmRecorder {
    mapping(address => uint256) public lastGm;

    event Gm(address user);

    function gm() external {
        require(block.timestamp > lastGm[msg.sender] + 1 days, "Too early");
        lastGm[msg.sender] = block.timestamp;
        emit Gm(msg.sender);
    }
}
