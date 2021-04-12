// SPDX-License-Identifier: MIT

pragma solidity =0.5.16;

interface IMETA {
  function checkWhitelist(address _address) external view returns (bool);

  /**
   * management functions.
   */
  function addSwapAddress(address swapper) external returns (bool);
  function removeSwapAddress(address swapper) external returns (bool);
  function getBot() external view returns (address);
  function setBot(address bot) external returns (bool);
}
