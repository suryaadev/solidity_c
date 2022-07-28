// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

// here we can learn inheritance and overriding 
// first need to import
import './SimpleStorage.sol';

// is contract name is used for inheritance
contract ExtraStorage is SimpleStorage {

    function store(uint256 _favvNum) public override{
        favNumber = _favvNum+10;
    }


    

}