// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const { ethers } = require("hardhat");
async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying Contract with account address", deployer.address);
  console.log(
    "Account Balance",
    (await deployer.provider.getBalance(deployer.address)).toString()
  );

  const Refrendum = await ethers.deployContract("Referendum");
  console.log("Refrendum Contract Deployed Successfully", Refrendum.target);

  const RefrendumFactory = await ethers.deployContract("ReferendumFactory");
  console.log(
    "Refrendum Factory Contract Deployed Successfully",
    RefrendumFactory.target
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
