//
//  Registration.swift
//  HotelManzana
//
//  Created by Алексей Сергеев on 23.04.2021.
//  Copyright © 2021 Алексей Сергеев. All rights reserved.
//

import Foundation


struct Registration {
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

