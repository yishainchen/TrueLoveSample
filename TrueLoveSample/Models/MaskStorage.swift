//
//  MaskStorage.swift
//  TrueLoveSample
//
//  Created by CHEN YI-SHAIN on 2020/4/6.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import Foundation

struct MaskStorage: Decodable {
    let maskInfo: MaskInfo
    
    private enum CodingKeys: String, CodingKey {
        case maskInfo = "properties"
    }
    
    init(maskInfo: MaskInfo) {
        self.maskInfo = maskInfo
    }
    
    init(from decoder: Decoder) throws {
          do {
              let values = try decoder.container(keyedBy: CodingKeys.self)
              maskInfo = try values.decode(MaskInfo.self, forKey: .maskInfo)
          } catch let error {
              print(#file)
              throw error
          }
      }
}
