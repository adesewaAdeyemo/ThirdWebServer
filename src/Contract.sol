// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract InfoStore {
    address private owner;

    struct Contact {
        string name;
        string gender;
        string nationality;
        string dateOfBirth;
        string voucherName;
        string voucherGender;
        string voucherNationality;
        string voucherDateOfBirth;
        string voucherRelationship; 
        address wallet;
    }

    Contact[] private contacts;

    constructor() {
        owner = msg.sender;
    } 

    modifier onlyOwner(){
        require(msg.sender == owner, "Only owner can call this function.");
        _; 
    }

    function addContact(string memory _name,string memory _gender, string memory _nationality, string memory _dateOfBirth, string memory _voucherName, string memory _voucherGender, string memory _voucherNationality, string memory _voucherDateOfBirth, string memory _voucherRelationship, address _wallet) public onlyOwner{
        contacts.push(Contact(_name, _gender, _nationality, _dateOfBirth, _voucherName, _voucherGender, _voucherNationality, _voucherDateOfBirth, _voucherRelationship,  _wallet));
    }

    function removeContact(uint _index) public onlyOwner  {
        require(_index < contacts.length, "Index out of buounds.");
        for (uint i=_index; i < contacts.length-1; i++) {
            contacts[i] = contacts[i + 1];
        }
        contacts.pop();
    }

    function getContacts() public view returns (Contact[] memory){
        return contacts; 
    }
}
