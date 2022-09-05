// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "solmate/src/mixins/ERC4626.sol";
import "solmate/src/tokens/ERC20.sol";

abstract contract Token is ERC4626 {
  constructor(
        ERC20 _asset,
        string memory _name,
        string memory _symbol
    ) ERC4626(_asset, _name, _symbol) {
    }
}
