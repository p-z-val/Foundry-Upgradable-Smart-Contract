//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {UUPSUpgradeable} from "@openZeppelin/openzeppelin-contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openZeppelin/openzeppelin-contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openZeppelin/openzeppelin-contracts-upgradeable/access/OwnableUpgradeable.sol";

contract BoxV2 is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 internal number;

    constructor() {
        _disableInitializers(); // This doesn't let any initialization happen. This is same as no constructor, its just more verbose
    }

    function initialize() public initializer {
        __Ownable_init(); // sets owner to msg.sender
        __UUPSUpgradeable_init(); // doesn't do anything as such but best to have it here. it says this is UUPSUpgradeable contract and should be treated as such
    }

    function setNumber(uint256 _number) external {
        number = _number;
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 2;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}
}
