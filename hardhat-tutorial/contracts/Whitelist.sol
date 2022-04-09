//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

	// Max number of whitelist addresses allowed
	uint8 public maxWhitelistAddresses;

	// Mapping of whitelist addresses whitelistedAddresses
	// if whitelisted then true, else false (default)
	mapping(address => bool) public whitelistedAddresses;

	// numAddressesWhitelisted used to keep track of how many addresses have been whitelisted
	uint8 public numAddressesWhitelisted;

	// Setting the max number of whitelisted addresses
	// User puts the value at time of deployment
	constructor(uint8 _maxWhitelisetedAddresses){
		maxWhitelistAddresses = _maxWhitelisetedAddresses;
	}
	
	/**
		addAddressToWhitelist:
		This function adds the address of the sender to the whitelist
	*/

	function addAddressToWhitelist() public {
		// check if sender has already been whitelisted
		require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

		// check if the number of addresses has not exceeded the maximum number of addresses
		require(numAddressesWhitelisted < maxWhitelistAddresses, "Limit reached");

		// add address which called the function addAddressToWhitelist
		whitelistedAddresses[msg.sender] = true;

		// increment the number of whitelisted addresses
		numAddressesWhitelisted += 1;
	}
}