// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

import "solidity-bytes-utils/contracts/BytesLib.sol";

contract PythSDK {
    
    // PriceFeed represents a current aggregation price from pyth publisher feeds.
    struct PriceFeed {
        // The price ID.
        bytes32 id;
        // Product account key.
        bytes32 productId;
        // The current price.
        int64 price;
        // Confidence interval around the price.
        uint64 conf;
        // Price exponent.
        int32 expo;
        // Status of price.
        PriceStatus status;
        // Maximum number of allowed publishers that can contribute to a price.
        uint32 maxNumPublishers;
        // Number of publishers that made up current aggregate.
        uint32 numPublishers;
        // Exponentially moving average price.
        int64 emaPrice;
        // Exponentially moving average confidence interval.
        uint64 emaConf;
        // Unix timestamp describing when the price was published
        uint64 publishTime;
        // Price of previous price with TRADING status
        int64 prevPrice;
        // Confidence interval of previous price with TRADING status
        uint64 prevConf;
        // Unix timestamp describing when the previous price with TRADING status was published
        uint64 prevPublishTime;
    }

    /* PriceStatus represents the availability status of a price feed.
        UNKNOWN: The price feed is not currently updating for an unknown reason.
        TRADING: The price feed is updating as expected.
        HALTED: The price feed is not currently updating because trading in the product has been halted.
        AUCTION: The price feed is not currently updating because an auction is setting the price.
    */
    enum PriceStatus {
        UNKNOWN,
        TRADING,
        HALTED,
        AUCTION
    }

}
