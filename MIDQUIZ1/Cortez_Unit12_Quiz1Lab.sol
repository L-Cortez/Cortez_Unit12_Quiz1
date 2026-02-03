// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Rizal_UnitX_Quiz1Lab {

    function calculateServiceFee(uint serviceCode)
        public
        pure
        returns (uint totalFee)
    {
        if (serviceCode == 1) {

            totalFee = 20000 + (20000 * 15 / 100);
        } else if (serviceCode == 2) {

            uint serviceCharge = 3000 * 8 / 100;
            uint subtotal = 3000 + serviceCharge;
            totalFee = subtotal + (subtotal * 15 / 100);
        } else {
            revert("Invalid service code");
        }
    }

    function generateHash(uint serviceCode)
        public
        pure
        returns (uint serviceFee, bytes32 hashValue)
    {
        serviceFee = calculateServiceFee(serviceCode);

       
        bytes1 lastFirstName = "e"; // Jose
        bytes1 firstMiddleName = "B"; // Balsa
        bytes1 lastLastName = "l"; // Rizal

        uint firstDigit = serviceFee;
        while (firstDigit >= 10) {
            firstDigit /= 10;
        }

        if (serviceCode == 1) {
            hashValue = keccak256(
                abi.encode(
                    lastFirstName,
                    firstMiddleName,
                    lastLastName,
                    serviceCode,
                    firstDigit
                )
            );
        } else if (serviceCode == 2) {
            hashValue = keccak256(
                abi.encodePacked(
                    lastFirstName,
                    firstMiddleName,
                    lastLastName,
                    serviceCode,
                    firstDigit
                )
            );
        } else {
            revert("Invalid service code");
        }
    }
}
