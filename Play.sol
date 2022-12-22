// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.9.0;

contract ETH_tr {
    address public admin;
    address payable[] public users;

    constructor() {
        admin = msg.sender; // to make the full access of the admin till now...!!
    }

    // get the ETH using transect...!!
    receive() external payable {
        require(msg.value >= 2 ether);
        users.push(payable(msg.sender));
    }

    // Send ETH to the user...!!
    function getETH() public view returns(uint) {
        require(msg.sender==admin);
        return address(this).balance;
    }

    function Random() public view returns(uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, users.length)));
    }

    function _Play_() public {
        require(msg.sender==admin);
        require(users.length>=3);
        uint r = Random();   // genrating the Random number to play the algo..
        address payable winner;  // geting the variable of the Winer...!!
        uint index = r % users.length;
        winner = users[index];
        winner.transfer(getETH());
    }
}
