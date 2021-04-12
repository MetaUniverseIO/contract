// SPDX-License-Identifier: MIT

pragma solidity =0.5.16;

interface IPairMETA {
  /**
   * Returns the amount of trade.
   */
  function minAmount() external view returns (uint256);
  function maxAmount() external view returns (uint256);

  /**
   * round functions.
   */
  function roundCountdownTimestamp() external view returns (uint256);
  function roundEnded() external view returns (bool);
  function roundNumber() external view returns (uint256);
  function roundWinner(uint256 _number) external view returns (address);
  function startRound() external returns (bool);
  function setRoundWinner(address _winner) external payable returns (bool);

  /**
   * management functions.
   */
  function maker() external view returns (address);
  function setMaker(address _maker) external returns (bool);
  function bot() external view returns (address);
  function setBot(address _bot) external returns (bool);
  function team() external view returns (address);
  function setTeam(address _team) external returns (bool);
  function meta() external view returns (address);
  function setMeta(address _meta) external returns (bool);
  function countdownDelay() external view returns (uint256);
  function setCountdownDelay(uint256 _delay) external returns (bool);
}
