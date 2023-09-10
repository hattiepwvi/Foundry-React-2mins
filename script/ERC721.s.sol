// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import {DevconPanda} from "src/ERC721.sol";

contract DevconPandaScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
        new DevconPanda();
    }
}
