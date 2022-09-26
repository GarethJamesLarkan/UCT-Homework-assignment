import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { Contract } from "@ethersproject/contracts";
import { ethers, expect, constants } from "./constants.test";

export const deployContract = async (deployer: SignerWithAddress) => {
  // there is no MyContract - replace with the contract you're testing
  const artifacts = await ethers.getContractFactory("MyContract", deployer);
  // constructor args go in the parentheses 
  return await artifacts.deploy()
}

module.exports = {
  deployContract,
}