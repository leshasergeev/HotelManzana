//
//  Registration.swift
//  HotelManzana
//
//  Created by Алексей Сергеев on 23.04.2021.
//  Copyright © 2021 Алексей Сергеев. All rights reserved.
//

import Foundation


struct Registration:CustomStringConvertible {
    var description: String {
        return "Registration:" + "\n" +
            "\t" + "firstName: \(firstName)" + "\n" +
            "\t" + "lastName: \(lastName)" + "\n" +
            "\t" + "emailAddress: \(emailAddress)" + "\n" +
            "\t" + "checkInDate: \(checkInDate)" + "\n" +
            "\t" + "checkOutDate: \(checkOutDate)" + "\n" +
            "\t" + "numberOfAdults: \(numberOfAdults)" + "\n" +
            "\t" + "numberOfChildren: \(numberOfChildren)" + "\n" +
            "\t" + "wifi: \(wifi)" + "\n" +
            "\t" + "roomType: \(roomType.name)" + "\n"
    }
    
    var firstName: String
    var lastName: String
    var emailAddress: String

    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numberOfChildren: Int

    var wifi: Bool
    var roomType: RoomType
}

