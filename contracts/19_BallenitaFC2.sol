// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BallenitaFCToken is ERC20, Ownable {

    // uint256 public precioToken = 1000 wei;
    // uint256 public precioToken2 = 1000 gwei;
    uint256 public precioToken3 = 0.001 ether; // equivale a 1000000000000000 
    

    constructor() ERC20("Ballenita Futbol Club Token", "BFT") Ownable(msg.sender) {
        _mint(owner(), 1000 * 10**18);
    }

    function mintear(address to, uint256 cantidad) public {
        _mint(to, cantidad * 10 ** 18);
    }

    function esSocio(address cuenta) public view returns (bool) {
        return balanceOf(cuenta) > 0;
    }

    function comprarTokens() public payable {
        uint256 cantidadBFT = msg.value / precioToken3;

        // mint son tokens nuevos
        _mint(msg.sender, cantidadBFT * 10 **18);
    }

    function retirar() public onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}