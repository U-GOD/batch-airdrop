// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Batch Airdrop Contract
/// @notice Allows the owner to deposit ETH and distribute it to multiple recipients
contract BatchAirdrop {
    /// @notice The owner who can distribute the airdrop
    address public owner;

    /// @notice Emitted when an airdrop is executed
    event AirdropExecuted(address[] recipients, uint256[] amounts);

    /// @notice Stes the contract deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    /// @notice Allow the contract to receive ETH directly
    receive() external payable {}

    /// @notice Restricts function access to the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    /// @notice Distributes ETH to multiple recipients
    function airdrop(address[] calldata recipients, uint256[] calldata amounts) external onlyOwner {
        require(recipients.length == amounts.length, "Recipients and amounts length mismatched");
        for (uint256 i = 0; i < recipients.length; i++) {
            (bool success, ) = payable(recipients[i]).call{value: amounts[i]}("");
            require(success, "Transfer failed");
        }
        emit AirdropExecuted(recipients, amounts);
    }

    ///@notice Returns the contract's ETH balance
    function contractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}