// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "../src/Vault.sol";

contract DeployScript is Script {
    function run() public {
        // TODO: encrypt your private key
        uint256 deployerPrivateKey = vm.envUint("SEPOLIA_WALLET_PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);

        vm.startBroadcast(deployerPrivateKey);

        VaultLogic logic = new VaultLogic(bytes32("0x1234"));
        console2.log("VaultLogic deployed to:", address(logic));

        Vault vault = new Vault(address(logic));
        console2.log("Vault deployed to:", address(vault));
        console2.log("Deployed by:", deployerAddress);

        //  VaultLogic deployed to: 0x9d996d75B1ED246CAf8C77851C3C0f7876A3cA2c
        //  Vault deployed to: 0x343D75FcEbaab96fAE8368B0B256ADf362E13aa8

        vm.stopBroadcast();
    }

    // The contract can receive ether to enable `payable` constructor calls if needed.
    receive() external payable { }
}
