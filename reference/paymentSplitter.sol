// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/finance/PaymentSplitter.sol";

contract Ps is PaymentSplitter {
  uint256 totalReceived = 0;
  constructor(address[] memory payees, uint256[] memory shares_) PaymentSplitter(payees,
      shares_) {
    totalReceived=0;
  }

  receive() override external payable {
    totalReceived += msg.value;
    emit PaymentReceived(_msgSender(), msg.value);
  }


  function check(address p) public view {
    uint256 _totalReceived = address(this).balance + totalReleased();
    uint256 amount = shares(p) / totalShares() * _totalReceived;
    // uint256 amount = shares(p) / totalShares() * totalReceived;
    assert(releasable(p) + released(p) == amount );
  }
}

