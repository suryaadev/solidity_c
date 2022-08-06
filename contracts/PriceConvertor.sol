    // SPDX-License-Identifier: MIT

    pragma solidity ^0.8.0;

    import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

    library PriceConvertor{

        function getVersion() internal view returns(uint256){
            
            AggregatorV3Interface price = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
            return price.version();
        }

        function getPrice() internal view returns(uint256){
            AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
            (,int256 price, , , ) = priceFeed.latestRoundData();
            return uint256(price * 1e10);
        }

        function getConversionRate(uint256 ethAmount) internal view returns(uint256){
            uint256 ethPrice = getPrice();
            
            uint256 ethAmtInUSD = (ethPrice * ethAmount) / 1e18;
            
            return ethAmtInUSD;
        }
    }