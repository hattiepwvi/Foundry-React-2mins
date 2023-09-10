//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

/**
 * 1、合约
 *    1） Counters.sol库用于计数器操作
 *    2）using 库合约 for 结构体名称（库合约里有结构体）：using 语法将 Counters.Counter 结构体与 Counters 库合约关联起来
 *        - 不是继承，无需创建库的实例。
 *           - 库合约是家具，不用创建房子（库合约）的实例
 *           - 继承用于扩展和修改已有的合约（要使用同一房子框架---父合约）：比如增加 mint 函数
 *
 *
 */

contract DevconPanda is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("DevconPanda", "DCP") {}

    function mint(
        address user,
        string memory tokenURI
    ) public returns (uint256) {
        uint256 newItemId = _tokenIds.current();
        _mint(user, newItemId);
        _setTokenURI(newItemId, tokenURI);

        _tokenIds.increment();
        return newItemId;
    }
}
