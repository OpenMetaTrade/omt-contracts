// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

interface IPriceFeed {
    function setLatestAnswer(int256 _answer) external;
}

contract PriceFeedOperator {
    address public gov;

    mapping(address => bool) public isAdmin;

    constructor() public {
        gov = msg.sender;
        isAdmin[msg.sender] = true;
    }

    function setAdmin(address _account, bool _isAdmin) public {
        require(msg.sender == gov, "PriceFeedOperator: forbidden");
        isAdmin[_account] = _isAdmin;
    }

    function setPricefeedPrice(
        address[] memory _pricefeed,
        int256[] memory _price
    ) public {
        require(isAdmin[msg.sender], "PriceFeedOperator: forbidden");
        for (uint256 i = 0; i < _pricefeed.length; i++) {
            IPriceFeed pricefeed = IPriceFeed(_pricefeed[i]);
            pricefeed.setLatestAnswer(_price[i]);
        }
    }

}
