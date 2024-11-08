// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "../src/Bank.sol";

contract BankSepoliaInteract is Script {
    Bank bank;

    function setUp() public {
        // Bind the deployed Bank contract address from the environment variable
        // payable is used to allow the contract to receive ETH, which is necessary for the withdraw function
        address payable bankAddress = payable(vm.envAddress("BANK_CONTRACT_ADDRESS"));
        bank = Bank(bankAddress);
    }

    function run() public view {
        // Get the Bank contract admin address
        address admin = bank.admin();
        console2.log("Bank admin address:", admin);

        // Get the total balance of the contract
        uint256 totalBalance = address(bank).balance;
        console2.log("Total balance in the bank:", totalBalance);
    }
}

// == Logs ==
//   Bank admin address: 0x059dC4EEe9328A9f163a7e813B2f5B4A52ADD4dF
//   Total balance in the bank: 0
