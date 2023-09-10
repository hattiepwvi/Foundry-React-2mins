// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Counter.sol";

contract CounterTest is Test {
    Counter counter;

    function setUp() public {
        counter = new Counter(10);
    }

    function testGetCount() public {
        int value = counter.getCounter();
        assertEq(value, 10);
        emit log_named_int("The count is", value);
    }

    function testIncrementCounter() public {
        counter.incrementCounter();
        int value = counter.getCounter();
        assertEq(value, 11);
        emit log_named_int("The count is", value);
    }
}
