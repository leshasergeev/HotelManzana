//
//  RoomType.swift
//  HotelManzana
//
//  Created by Алексей Сергеев on 23.04.2021.
//  Copyright © 2021 Алексей Сергеев. All rights reserved.
//

import Foundation


struct RoomType: Equatable {
    var id: Int
    var name: String
    var shortName: String
    var price: Int

    //Equatable Protocol Implementation for RoomType
    static func ==(lhs: RoomType, rhs: RoomType) -> Bool {
        return lhs.id == rhs.id
    }
}
