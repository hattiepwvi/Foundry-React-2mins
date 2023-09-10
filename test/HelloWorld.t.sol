// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/HelloWorld.sol";

/**
 * 2、测试
 *    1） is继承 Test
 *    2) 测试前准备： 不用部署，直接创建合约实例
 *    3） 测试：测试函数（对比 hardhat 的 it）、断言
 *        - 断言： assertEq(value, expected)
 *        - 模糊测试 fuzzing：自动随机生成测试所需的输入数据(比如函数的参数)
 *             - 测试函数（参数类型 名）； assertEq(value, 参数)
 *        - log: emit log(); 类似于 console.log();
 *             - 三种：log (通用版，本文案例)， log_string (字符串版)， log_bytes (字节版)
 *             - 查看(2到4个v都可)：forge test -vv
 *
 */

contract HelloWorldTest is Test {
    HelloWorld hello;

    function setUp() public {
        hello = new HelloWorld("Foundry is fast!");
    }

    function test1() public {
        assertEq(hello.greet(), "Foundry is fast!");
    }

    function test2() public {
        assertEq(hello.version(), 0);
        hello.updateGreeting("Hello World");
        assertEq(hello.version(), 1);
        assertEq(hello.greet(), "Hello World");
    }

    // fuzzing
    function test3(string memory _greeting) public {
        assertEq(hello.version(), 0);
        hello.updateGreeting(_greeting);
        assertEq(hello.version(), 1);
        assertEq(hello.greet(), _greeting);
    }

    // logging
    function test4() public {
        assertEq(hello.version(), 0);
        hello.updateGreeting("Hello World");
        assertEq(hello.version(), 1);
        string memory value = hello.greet();
        emit log(value);
        assertEq(hello.greet(), "Hello World");
    }
}
