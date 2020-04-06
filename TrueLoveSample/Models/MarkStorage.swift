//
//  MarkStorage.swift
//  TrueLoveSample
//
//  Created by CHEN YI-SHAIN on 2020/4/6.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import Foundation

struct MarkStorage {
    let id: String
    let name: String
    let adultMask: Int
    let county: String
}

extension MarkStorage: Codable {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case adultMask = "mask_adult"
        case county
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(adultMask, forKey: .adultMask)
        try container.encode(adultMask, forKey: .adultMask)
        try container.encode(county, forKey: .county)
    }
}
