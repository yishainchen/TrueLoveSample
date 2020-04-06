//
//  MaskInfo.swift
//  TrueLoveSample
//
//  Created by CHEN YI-SHAIN on 2020/4/6.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import Foundation

struct MaskInfo {
    let id: String
    let name: String
    let adultMask: Int
    let county: String
}

extension MaskInfo: Codable {

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case adultMask = "mask_adult"
        case county
    }
    
    init(from decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decode(String.self, forKey: .id)
            name = try values.decode(String.self, forKey: .name)
            adultMask = try values.decode(Int.self, forKey: .adultMask)
            county = try values.decode(String.self, forKey: .county)
        } catch let error {
            print(#file)
            throw error
        }
    }
    
}
