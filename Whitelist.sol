// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Whitelist {

    address owner;

    mapping (address => bool) whitelistedAddresses;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Ownable: caller is not the owner");
        _;
    }

    function addUser(address[] memory arr) public onlyOwner  {
        for (uint256 i = 0; i < arr.length; i++) {
            whitelistedAddresses[arr[i]]=true;     //only owner can whitelist address
        }

    }

    function verifyUser(address _whitelistedAddress) public view returns(bool) {  //this function will verify if the address is whitelisted or not, it will return true and false vice=versa
        bool userIsWhitelisted = whitelistedAddresses[_whitelistedAddress];
        return userIsWhitelisted;
    }

}