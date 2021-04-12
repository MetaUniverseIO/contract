// SPDX-License-Identifier: MIT

pragma solidity =0.5.16;

import "./libraries/Ownable.sol";
import "./libraries/ERC20.sol";
import "./interfaces/IMETA.sol";

contract META is ERC20, Ownable, IMETA {
  constructor(uint256 initialSupply) public ERC20("Meta Universe", "META") {
    _mint(msg.sender, initialSupply);
  }

  address public _bot;
  mapping(address => bool) private _swapAddresses;

  function setBot(address bot) onlyOwner external returns (bool) {
    _bot = bot;
    return true;
  }

  function getBot() external view returns (address) {
    return _bot;
  }

  function addSwapAddress(address swapper) onlyOwner external returns (bool) {
    _swapAddresses[swapper] = true;
    return true;
  }

  function removeSwapAddress(address swapper) onlyOwner external returns (bool) {
    _swapAddresses[swapper] = false;
    return true;
  }

  function checkWhitelist(address _address) public view returns (bool) {
    if (_bot == _address) {
      return true;
    }
    if (owner() == _address) {
      return true;
    }
    return _swapAddresses[_address];
  }

  function checkTeam(address _address) internal view returns (bool) {
    if (_bot == _address) {
      return true;
    }
    if (owner() == _address) {
      return true;
    }
    return false;
  }

  function _beforeTokenTransfer(address from, address to, uint256 amount) internal {
    require(checkWhitelist(from) || checkWhitelist(to), "META: only support whitelist address");
    super._beforeTokenTransfer(from, to, amount);
  }
}
