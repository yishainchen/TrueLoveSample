//
//  MaskInfoServiceMock.swift
//  TrueLoveSampleTests
//
//  Created by CHEN YI-SHAIN on 2020/4/7.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import Foundation

struct MaskInfoServiceMock: MaskInfoServiceProtocol {
    func fetchMaskStorageInfo(with completion: @escaping ([MaskStorage]?, Error?) -> Void) {}
}
