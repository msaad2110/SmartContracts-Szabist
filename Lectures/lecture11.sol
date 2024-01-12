// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Saad is ERC721, Ownable {
    uint256 private _nextTokenId;

    constructor(address initialOwner)
        ERC721("Saad", "MTK")
        Ownable(initialOwner)
    {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://saafnft.com/";
    }

    function safeMint(address to) public payable {
        require(msg.value == 1 ether, "Paisa de bhai");
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }
    function withdraw() external onlyOwner{
        payable(msg.sender).transfer(address(this).balance);
    }
}
