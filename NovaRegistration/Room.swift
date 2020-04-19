//
//  Room.swift
//  NovaRegistration
//
//  Created by Pharoah Campbell on 4/16/20.
//  Copyright © 2020 Pharoah. All rights reserved.
//

import Foundation
struct Room
{
    let RoomNumber: Int
    let Price: Double
    let Person1: String
    let Person2: String
    let Person3: String
    let Person4: String
}
extension Room
{
    init?(json: [String: Any])
    {
        guard let RoomNumber = json["RoomNumber"] as? Int,
        let Price = json["Price"] as? Double,
        let Person1 = json["Occupant1"] as? Int,
        let Person2 = json["Occupant2"] as? Int,
        let Person3 = json["Occupant3"] as? Int,
        let Person4 = json["Occupant4"] as? Int
        else
        {
            return nil
        }
    }
}
