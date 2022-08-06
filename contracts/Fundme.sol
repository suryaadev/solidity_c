// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./PriceConvertor.sol";

contract Fundme{

    using PriceConvertor for uint256;
    uint256 public minUSD = 10*1e18;
    address[] public funders;
    address public owner;
    mapping(address=> uint256) public addressToAmt;

    constructor(){
        owner = msg.sender;
    }

    function fund() public payable {

        require(msg.value.getConversionRate() >= minUSD, "Not enough USD sent" );
        funders.push(msg.sender);
    }


    function withdraw() public{
        require(msg.sender == owner, "sender is not owner");
        for(uint256 i; i<funders.length; i++){
            address sender = funders[i];
            addressToAmt[sender] = 0;
        }
        funders = new address[](0);

        (bool callSuccess,) = payable(msg.sender).call{value:address(this).balance}("");
        require(callSuccess, "call failed");
    }
    
}