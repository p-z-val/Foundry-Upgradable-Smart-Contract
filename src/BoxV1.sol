//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {UUPSUpgradeable} from "@openZeppelin/openzeppelin-contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openZeppelin/openzeppelin-contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openZeppelin/openzeppelin-contracts-upgradeable/access/OwnableUpgradeable.sol";

// To remmember: Storage is stored in the proxy contract and not in the implementation contract

//proxy-> deploys implementation -> call some "initializer " function
//Proxy contracts don;t have constructors

contract BoxV1 is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 internal number;

    constructor() {
        _disableInitializers(); // This doesn't let any initialization happen. This is same as no constructor, its just more verbose
    }

    function initialize() public initializer {
        __Ownable_init(); // sets owner to msg.sender
        __UUPSUpgradeable_init(); // doesn't do anything as such but best to have it here. it says this is UUPSUpgradeable contract and should be treated as such
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}
}

//Proxies point to storage slots and not specific variable names
//Best practice is to have empty reserved space to allow future versions to add new variables without shifting down storage in the inheritance chain.

//BoxV1 is an upgradble contract

//What is Initializable.sol?
/**
 * @dev This is a base contract to aid in writing upgradeable contracts, or any kind of contract that will be deployed
 * behind a proxy. Since proxied contracts do not make use of a constructor, it's common to move constructor logic to an
 * external initializer function, usually called `initialize`. It then becomes necessary to protect this initializer
 * function so it can only be called once. The {initializer} modifier provided by this contract will have this effect.
 *
 * The initialization functions use a version number. Once a version number is used, it is consumed and cannot be
 * reused. This mechanism prevents re-execution of each "step" but allows the creation of new initialization steps in
 * case an upgrade adds a module that needs to be initialized.
 */
