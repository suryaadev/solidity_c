// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

contract StorageFactory {

    // SimpleStorage public simpleStorage; 
    SimpleStorage[] public simpleStorageArray; //this is an array implementation in solidity

    function callContract() public{
        // simpleStorage = new SimpleStorage(); this way we can create the object of simpleStorage...
        
        SimpleStorage simpleStorage = new SimpleStorage(); //object created to store into array.
        
        simpleStorageArray.push(simpleStorage);

    }

    function sfStore(uint256 _index, uint256 _number) public{

        /* for calling any function from the specific file we need address of that contract
         for address which we store on the in array.
         next thing which we rerquired is ABI which comes handy when we import the contract*/

        SimpleStorage simpleStorage = simpleStorageArray[_index]; //here we fetch the address of the index we mentioned
        simpleStorage.store(_number); //call funtion in simpleStorage 
    }

    function sfGet(uint256 _index) public view returns(uint256){
        SimpleStorage simpleStorage = simpleStorageArray[_index];
        return simpleStorage.restore();
    }
}