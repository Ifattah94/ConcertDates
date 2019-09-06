//
//  Concert.swift
//  ConcertDates
//
//  Created by C4Q on 9/6/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import Foundation
struct ConcertWrapper: Codable {
    let events: [Concert]
}
struct Concert: Codable {
    let title: String
    let dateTimeLocal: String
    
    
    private enum CodingKeys: String, CodingKey {
        case title
        case dateTimeLocal = "datetime_local"
    }
}
