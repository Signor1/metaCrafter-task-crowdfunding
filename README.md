# Crowdfunding Smart Contract

## Description

This Solidity smart contract, built using Hardhat, facilitates crowdfunding by allowing users to contribute funds towards a specified goal within a set timeframe. The contract tracks contributions from various addresses and enables the organizer to finalize the campaign once the deadline is reached. If the funding goal is met, the organizer can withdraw the funds; otherwise, contributors can claim refunds.

## Getting Started

### Installing

To use this contract:

1. Clone the repository or download the `.sol` file.
2. Ensure you have Node.js and npm installed on your system.
3. Install Hardhat globally:
   ```
   npm install -g hardhat
   ```
4. Initialize a new Hardhat project in your project directory:
   ```
   npx hardhat init
   ```
5. Replace the `contracts/Crowdfunding.sol` file in your Hardhat project directory with the provided contract file.
6. Compile the contract:
   ```
   npx hardhat compile
   ```

### Executing program

To interact with the deployed contract:

1. Deploy the contract to a local development network or a testnet using Hardhat's deployment scripts.
2. Contribute funds to the campaign by calling the `contribute()` function.
3. Finalize the campaign using the `finalizeCampaign()` function after the deadline has passed.
4. If the funding goal is met, the organizer can withdraw the funds. Otherwise, contributors can claim refunds.

## Help

For any questions or issues related to using Hardhat or interacting with the Ethereum blockchain, please refer to the Hardhat documentation or seek assistance from the Ethereum community.

## Authors

- [Omemgboji Emmanuel](mailto:emmanuelomemgboji@gmail.com)
- [SignorDev](https://twitter.com/onesignor)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.