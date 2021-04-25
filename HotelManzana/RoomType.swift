//
//  RoomType.swift
//  HotelManzana
//
//  Created by Алексей Сергеев on 23.04.2021.
//  Copyright © 2021 Алексей Сергеев. All rights reserved.
//

import Foundation


/**
 Parameters:
    - id: Int
    - name: String
    - shortName: String
    - price: Int
*/
struct RoomType: Equatable {
    
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    static var all: [RoomType] {
        return [RoomType(id: 0, name: "Two Queens", shortName: "2Q", price: 179),
                RoomType(id: 1, name: "One King", shortName: "K", price: 209),
                RoomType(id: 2, name: "Penthouse Suite", shortName: "PHS", price: 309)]
    }
    
    //Equatable Protocol Implementation for RoomType
    static func ==(lhs: RoomType, rhs: RoomType) -> Bool {
        return lhs.id == rhs.id
    }
}
