// SPDX-License-Identifier: MIT
pragma solidity 0.8.19; // dApps, web3

contract demo{
    string[] _usernames;
    string[] _passwords;

    mapping(string=>bool) _users;

    function signup(string memory username,string memory password) public {
        require(!_users[username]);
        _usernames.push(username);
        _passwords.push(password);
        _users[username]=true;
    }

    function login(string memory username,string memory password) public view returns(bool){
        require(_users[username]);
        
        for(uint i=0;i<_usernames.length;i++){
            if((keccak256(abi.encodePacked(username))==keccak256(abi.encodePacked(_usernames[i])))&&(keccak256(abi.encodePacked(password))==keccak256(abi.encodePacked(_passwords[i]))))
                return true;
        }
        return false;
    }
}
