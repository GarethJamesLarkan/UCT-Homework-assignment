import { Contract } from "@ethersproject/contracts";
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { ethers } from "./constants.test";
import { deployContract } from "./helpersTemplate.test"

describe("tests", () => {
  let owner: SignerWithAddress, artist: SignerWithAddress, buyer: SignerWithAddress;

  // this var name should be changed to something more descriptive
  let Contract: Contract;

  beforeEach(async () => {
    // Put logic that will be needed before every test
    [owner, artist, buyer] = await ethers.getSigners();

    Contract = await deployContract(owner);
  });

  describe("view functions", () => {
    it("returns something properly")
    it("can't return something that doesn't exist")
  })

  // there can easily be more than one section for this
  // this is just a loose category, things like minting, royalties, and more 
  //   are commonly split into their own describe blocks
  describe("state-changing functions", () => {

  })

  describe("event tests", () => {
    
  })
})