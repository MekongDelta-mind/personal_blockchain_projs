// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./SimpleStorage.sol"; // importing the contract "SimpleStorage.sol" from directory ".(current dir)"

contract StorageFactory is SimpleStorage { // Solidity form of inheritance to inherit another contract
    
    SimpleStorage[] public simpleStorageArray; //creating array of the SimpleStorage type
    
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
    
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address 
        // ABI 
        //this line has an explicit cast to the address type and initializes a new SimpleStorage object from the address
        
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber); 
        
        // Similar to calling a Constructor of class by passing the paramters.
        //Instead of storing the newly created object's ref in a variable we are here calling the store mehtod directly on the object

        //this line simply gets the SimpleStorage object at the index _simpleStorageIndex in the array simpleStorageArray
        //simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }
    
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        //this line has an explicit cast to the address type and initializes a new SimpleStorage object from the address 
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve(); 

        //this line simply gets the SimpleStorage object at the index _simpleStorageIndex in the array simpleStorageArray
        //return simpleStorageArray[_simpleStorageIndex].retrieve(); 
    }
}
