// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Journey {

    //A human is locked in a room with no escape! There is 1 door with a 5 digit passcode needed to unlock the door. 
    //Find the passcode and unlock the door

    address public owner;

    uint256 public flaskInWater = 7;
    uint256 public dieInTog = 9;
    uint256 public noDogAnywhere = 4;

    uint256 public numberOfHumans = 0;

    uint256 private answer;
    
    mapping(uint256 => uint256) public passCode;
    mapping(uint256 => uint256) public pastPlayersAge;
    mapping(string => uint256) public humansNameToPosition;
    mapping(uint256 => Human) public humans;

    enum ALIVE_STATUS{
        ALIVE,
        DEAD
    }

    struct Human {
        string name;
        uint256 age;
        uint256 timeSpentInRoom;
        ALIVE_STATUS status;
    }

    constructor(address _owner){
        owner = _owner;
    }

    function createHuman(string memory _name, uint256 _age, uint256 _timeSpentInRoom, ALIVE_STATUS _status) public onlyOwner(msg.sender) {
        humans[numberOfHumans] = Human({
            name: _name,
            age: _age,
            timeSpentInRoom: _timeSpentInRoom,
            status: _status
        });

        humansNameToPosition[_name] = numberOfHumans;

        numberOfHumans++;
    }

    function setAnswer(uint256 _answer) public {
        answer = _answer;
    }

    function getClueOne() public pure returns (string memory) {
        return "Your first digit in the passcode is hiding in 1 of the variables";
    }

    function getClueTwo() public pure returns (string memory) {
        return "Your first digit is the KEY to understanding who played before you that was 25 years old";
    }

    function getClueThree() public pure returns (string memory) {
        return "The time spent in the room for john";
    }

    function getClueFour() public pure returns (string memory) {
        return "The ID of the only dead human";
    }

    function getClueFive() public pure returns (string memory) {
        return "The amount of bytes used in state variable storage";
    }

    function getHumanPosition(string memory _name) public view returns (uint256) {
        return humansNameToPosition[_name];
    }

    function getHuman(uint256 _position) public view returns (Human memory) {
        return humans[_position];
    }
    
    function checkAnswer() public view returns (string memory){

        uint256 total;

        for(uint256 x = 0; x < 7; x++){
            total += passCode[x];
        }

        if(answer == total){
            return "YOU WIN";
        }else{
            return "YOU LOSE";
        }

    }

    function addDigit(uint256 _digit, uint256 _position) public {
        passCode[_position] = _digit;
    }

    modifier onlyOwner(address _sender){
        require(_sender == owner, "Only Owner");
        _;
    }

}
