pragma solidity ^0.5.0;

import "./PupperCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";

// @TODO: Inherit the crowdsale contracts
contract PupperCoinSale is {

    uint rate, // rate in TKNbits
        address payable wallet, // sale beneficiary
        ArcadeToken token // the ArcadeToken itself that the ArcadeTokenSale will work with
    )
        Crowdsale(rate, wallet, token)
        public
    {
        // constructor can stay empty
    }
}

contract PupperCoinSaleDeployer {

    address public token_sale_address;
    address public token_address;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet // this address will receive all Ether raised by the sale
    )
        public
    {
        // create the NewToken and keep its address handy
        NewToken token = new NewToken(name, symbol, 0);
        token_address = address(token);

        // create the NewTokenSale and tell it about the token
        NewTokenSale arcade_sale = new NewTokenSale(1, wallet, token);
        New_sale_address = address(arcade_sale);

        // make the NewTokenSale contract a minter, then have the NewTokenSaleDeployer renounce its minter role
        token.addMinter(arcade_sale_address);
        token.renounceMinter();
    }
}
