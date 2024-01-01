// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract TokenizedAssetManagement is ERC721 {
    address public owner;
    uint256 public nextTokenId = 1;
    uint256 public constant fractionsPerAsset = 100;

    struct Asset {
        uint256 firstTokenId;
        uint256 lastTokenId;
    }

    mapping(uint256 => Asset) public assets;

    event AssetCreated(uint256 indexed assetId, uint256 firstTokenId, uint256 lastTokenId);

    constructor() ERC721("TokenizedAsset", "TA") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function createAsset() external onlyOwner {
        uint256 firstTokenId = nextTokenId;
        uint256 lastTokenId = firstTokenId + fractionsPerAsset - 1;

        for (uint256 i = firstTokenId; i <= lastTokenId; i++) {
            _mint(owner, i);
            nextTokenId++;
        }

        assets[firstTokenId] = Asset(firstTokenId, lastTokenId);
        emit AssetCreated(firstTokenId, firstTokenId, lastTokenId);
    }
}