// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^8.0.10;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";

// import "@openzeppelin/contracts/access/Ownable.sol";

contract collection is ERC721Upgradeable {
    uint256 private tokenID;
    string private url;
    uint256 private maxQuantity;
    uint16 private edition;
    uint16 private cost;

    function initialize(
        string memory name_,
        string memory symbol_,
        string memory assetUrl,
        string memory creatorName,
        uint256 maxQuantity_,
        uint16 edition_,
        uint16 cost_,
        uint16 royalty
    ) public initializer {
        __ERC721_init(name_, symbol_);
        tokenID = 0;
        url = assetUrl;
        maxQuantity = maxQuantity_;
        edition = edition_;
        cost = cost_;
    }

    function mint(address to, uint256 tokenId) public payable {
        require(tokenID < maxQuantity, "Max quantity reached");
        require(msg.value < cost, "Not Enough gas.");
        tokenID += 1;
        _mint(to, tokenID);
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return url;
    }

    function getEdition() public view returns (uint16) {
        return edition;
    }
}
