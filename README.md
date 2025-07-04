# Batch Airdrop Smart Contract

This Solidity smart contract enables the contract owner to **fund** the contract with ETH and later **airdrop** arbitrary amounts to multiple addresses in a single transaction.

## ✨ Features
- Contract owner can deposit ETH to the contract
- Owner-only function to distribute ETH to a list of addresses
- Emits an event when an airdrop is executed
- Supports sending different amounts to each recipient

## 🛠 How It Works
1. **Funding the Contract:**  
   Send ETH directly to the contract address via your wallet to fund it.

2. **Airdrop Function:**  
   Call `airdrop()` with:
   - `recipients` (array of addresses)
   - `amounts` (array of amounts in wei)
   The contract loops through and sends each recipient the specified amount.  
   Only the contract owner can call this function.

## ✏️ Example
**Funding Example:**  
Send 0.01 ETH to the contract address using MetaMask or any wallet.

**Airdrop Example:**  
recipients = [
  "0xRecipient1...",
  "0xRecipient2..."
]

amounts = [
  5000000000000000,
  5000000000000000
]
  // 0.005 ETH for each address

## 🧑‍💻 Owner
The deployer address becomes the contract owner automatically.

## 🚀 Deployment
This contract was deployed on zkSync testnet.
