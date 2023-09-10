// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {HelloWorld} from "src/HelloWorld.sol";

/**
 * 3、Script
 * 3.1 部署 Anvil : 本地节点local node
 *    1） 部署：anvil
 *        - 给 10 个账户，localhost 8545
 *        - 设置环境变量
 *           - 设置私钥（Anvil给的）：export PRIVATE_KEY=<your-private-key>
 *                  - 查看设置的私钥： echo $PRIVATE_KEY
 *        - 运行部署脚本--->生成合约地址（对比 ethers 部署需要 abi, 字节码， wallet即私钥和provider即Alchemy url）：forge script script/脚本名:脚本里的部署合约的名字（不是合约名） --fork-url 本地网络（对比 Alchemy_URL） \
--private-key $PRIVATE_KEY --broadcast
                 - 举例：forge script script/HelloWorld.s.sol:ContractScript --fork-url http://localhost:8545 \
--private-key $PRIVATE_KEY --broadcast
 *
 *    2） 脚本：
 *       - setUp()函数在部署合约之前可以执行一些初始化操作
 *       - run()函数是部署脚本的入口函数。
 *             - vm.broadcast() 函数用于将部署脚本广播到网络中的所有节点（对比 hardhat 用 solidity 语言的事件来广播消息）。
 *                 - 事件触发时，向合约的事件监听器发送广播消息（合约可以通过广播消息的方式通知、通信、交互其他合约或外部应用程序。）
 *                 - 对比用事件发消息：更直接发消息（不用定义和触发事件），立即发消息（不需要等待事件被监听和处理）
 *                 - 可一次性广播所有，也可分部分广播
 *             - 创建合约实例 （对比 hardhat 需要用工厂合约进行部署）
 * 
 * 3.2 Cast: 交易（与合约交互）; 发起 RPC call（读）和 send(写，要私钥)
 *     1) 设置环境变量 合约地址：export CONTRACT_ADDRESS=<your-contract-address>
 *     2）cast call 地址 函数名：cast call $CONTRACT_ADDRESS "greet()(string)"
 *     3）cast send 地址 函数名 参数 私钥：cast send $CONTRACT_ADDRESS "updateGreeting(string)" "My new greeting" --private-key $PRIVATE_KEY
 * 
 * 4、安装包: 安装包--> 映射（让 IDE 编译器知道包的位置）
 *    1）OpenZeppelin
 *       - forge install OpenZeppelin/openzeppelin-contracts
 *          - 没有 git history 无法使用 forge install 
 *
 */

contract ContractScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
        new HelloWorld("Hello from Foundry!");
    }
}
