// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract simplestorage {
    //this is where you will write contract logic
    uint256 private  favoriteNumber;

    uint256[] public favoriteNumbers; // Dynamic array to stores multiple favourite number

    // struc to store a person's name and their favourite number
    struct Person {
        string name; //Person's name
        uint256 favoriteNumber; // their favourite number
    }

    Person[] public people; //array of person sturcts store multiple people'sdata
    //Enum to manage contract states (Active or nactive)

    enum contractstate {
        Active, //state representing an active contract
        Inactive //state representing an inactive contract
    }
    contractstate public state; //state variable to storethe current contract state

    function storeNumber(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function getfavoriteNumber() public view returns (uint256) {
        return favoriteNumber;
    }

    function isGreaterThan(uint256 _compareValue) public view returns (bool) {
        if (favoriteNumber > _compareValue) {
            return true;
        } else {
            return false;
        }
    }

    function sumTofavoriteNumber() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 1; i <= favoriteNumber; i++) {
            sum += i;
        }
        return sum;
    }

    function internalFunction()internal pure returns(string memory) {
        return "this is an internal function";//internal: Can be accessed within this contract or derived contract
    }
    

    //wrapper function to expose internal function for testing purpose
    function callInternalFunction() public pure returns (string memory) {
        return internalFunction();// Calls the internal function from within the Contract
    }

    function externalFunction()external pure returns(string memory) {
        return "this is an external function";// external: Can only be called from outside the contract
    }

    function testExternalFunction() public view returns (string memory) {
        return this.externalFunction();//calls the External Function within the contract using 'this'
    }

    function addfavoriteNumber(uint256 _number) public {
        favoriteNumbers.push(_number);
    }

    function returnNumbers()public view returns(uint256[]memory) {
        return favoriteNumbers;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(Person(_name,_favoriteNumber));
    }

    function activateContract() public {
        state = contractstate.Active;
    }

    function deactivateContract() public {
        state = contractstate.Inactive;
    }

    function isActive() public view returns (bool) {
        return state ==contractstate.Active;
    }
}
