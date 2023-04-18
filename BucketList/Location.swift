//
//  Location.swift
//  BucketList
//
//  Created by Matheus Viana on 17/04/23.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
