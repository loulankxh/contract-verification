// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC777/ERC777.sol";

contract Token is ERC777 {
    uint256 totalBalance;
    constructor(address[] memory defaultOperators_) ERC777("Token", "MCO",
        defaultOperators_) {
      totalBalance = 0;
    }

    function mint(address account, uint256 amount,
        bytes memory userData,
        bytes memory operatorData) public {
        _mint(account, amount, userData, operatorData);
        totalBalance += amount;
    }


    function burn(address account, uint256 amount, bytes memory data) public {
        _burn(_msgSender(), amount, data, "");
        totalBalance -= amount;
    }

    function equalBalance() public view {
      assert(totalSupply() == totalBalance);
    }
}
