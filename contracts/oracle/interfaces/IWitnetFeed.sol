// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

interface IWitnetFeed {
  function lastPrice() external view returns (int256);
}
