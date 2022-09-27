// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Journey {

    //A human is locked in a room with no escape! There is 1 door with a 7 digit passcode needed to unlock the door. 
    //Find the passcode and unlock the door

    address public owner;

    uint256 public flaskInWater = 7;
    uint256 public dieInTog = 9;
    uint256 public noDogAnywhere = 4;
    
    mapping(uint256 => uint256) public passCode;
    mapping(uint256 => uint256) public pastPlayersAge;
    mapping(string => uint256) public humansNameToPosition;
    mapping(uint256 => Human) public humans;

    uint256[] public randomNumbers;

    struct Human {
        string name;
        uint256 age;
        uint256 timeSpentInRoom;
        bool survived;
    }

    constructor(address _owner){
        owner = _owner;
    }

    function getClueOne() public pure returns (string memory) {
        return "Your first digit in the passcode is hiding in 1 of the variables";
    }

    function getClueTwo() public pure returns (string memory) {
        return "Your first digit is the KEY to understanding who played before you, and how old they were";
    }

    function getClueThree() public pure returns (string memory) {
        return "The time spent in the room for john";
    }

    function getClueFour() public pure returns (uint256) {
        
    }

    function getHumanPosition(string memory _name) public view returns (uint256) {
        return humansNameToPosition[_name];
    }

    function getHuman(uint256 _position) public view returns (Human memory) {
        return humans[_position];
    }
    
    function checkAnswer() public {

    }

    function addDigit(uint256 _digit, uint256 _position) public {
        passCode[_position] = _digit;
    }


    modifier onlyOwner(address _sender){
        require(_sender == owner, "Only Owner");
        _;
    }

}
