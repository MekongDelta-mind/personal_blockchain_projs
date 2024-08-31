// SPDX-License-Identifier: MIT
// the above line is to add a liscence for the this("SimpleStorage.sol") which is like opne source liscence

pragma solidity >=0.6.0 <0.9.0;
//pragma solidity >=0.6.0 ; // every compiler above version 0.6.0
//pragma solidity ^0.6.0 ; // every compiler above version 0.6.0 below 0.7 and above 0.6



contract SimpleStorage {

    // this will initialize to 0 like Java
    uint256 favoriteNumber; // un-signed integer of 256 bits
/*  Other data types used in solidity
    bool favoriteBoolean = true ;
    string favoriteString = 'string' ;
    int256 favoriteInt = -5 ; // this can contain unsigned integer
    address favoriteAddress = 0X16343943169463169fe434136f641625843 ; // this is a new type of data type 
                                                                    which stores the address of the blockchain or the account in which you are trying to deal with
*/
    // This is a comment!
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people; // dynmaic array
//    People[3] public people; // fixed array of size 3


    mapping(string => uint256) public nameToFavoriteNumber; //key -> string and value -> unit256

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
