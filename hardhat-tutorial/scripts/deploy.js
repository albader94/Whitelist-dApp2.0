const { ethers } = require("hardhat");

async function main() {

	// abstract whitelistContract using getContractFactory from ethers.js
	const whitelistContract = await ethers.getContractFactory("Whitelist");

	// deploy whitelistContract
	// 10 is the maximum allowed whitelisted addresses
	const deployedWhitelistContract = await whitelistContract.deploy(10);

	// wait to finish deploying
	await deployedWhitelistContract.deployed();

	// print the address of the deployed contract
	console.log(
		"Whitelist contract address",
		deployedWhitelistContract.address
	);
}

// call main and catch if there are any errors
main().then(() => process.exit(0)).catch((error) => {
	console.error(error);
	process.exit(1);
});