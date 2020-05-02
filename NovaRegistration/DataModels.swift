//
//  DataModels.swift
//  NovaRegistration
//
//  Created by Pharoah Campbell on 4/26/20.
//  Copyright © 2020 Pharoah. All rights reserved.
//

struct Student:Decodable
{
    let NNumber: Int
    let FirstName: String
    let LastName: String
    let Sex: String
    let Level: String
    let RazersEdge: Bool?
    let Athlete: Bool?
}
struct Room: Decodable
{
    let RoomNumber: Int
    var Price: Int
    var Occupant1: Int?
    var Occupant2: Int?
    var Occupant3: Int?
    var Occupant4: Int?
}
struct Result: Decodable
{
    let results: [Room]
}
