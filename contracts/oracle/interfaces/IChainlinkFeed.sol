// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IChainlinkFeed {
  function decimals() external view returns (uint8);

  function latestAnswer() external view returns (uint256);
}
