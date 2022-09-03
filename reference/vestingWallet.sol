// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/finance/VestingWallet.sol";

contract Vw is VestingWallet {

  constructor(address beneficiaryAddress, uint64 startTimestamp, 
      uint64 durationSeconds) 
      VestingWallet(beneficiaryAddress, startTimestamp, durationSeconds) {
  }

  function earlyRelease() public view {
    // assert(released() == 0 || block.timestamp > start());
    assert(released() == 0 );
  }


}

