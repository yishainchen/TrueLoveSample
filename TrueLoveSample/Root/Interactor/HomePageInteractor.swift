//
//  HomePageInteractor.swift
//  TrueLoveSample
//
//  Created by CHEN YI-SHAIN on 2020/4/6.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import Foundation

protocol HomePageInteractor {
    func getMaskStorageInfo(_ completion: @escaping (_ maskInfoMap: [String: Int]?) -> Void)
    func setMaskInfoMap(with maskStorageList: [MaskStorage]) -> [String: Int]
}

class HomePageDefaultInteractor: HomePageInteractor {
    
    private let maskInfoService: MaskInfoServiceProtocol
    var maskInfoMap: [String: Int] = [:] // [CountyName: MaskCount]
    
    init(maskInfoService: MaskInfoServiceProtocol) {
        self.maskInfoService = maskInfoService
    }
    
    func getMaskStorageInfo(_ completion: @escaping (_ maskInfoMap: [String: Int]?) -> Void) {
        maskInfoService.fetchMaskStorageInfo { [weak self] (maskStorageList, error) in
            guard let weakSelf = self, let maskStorageList = maskStorageList else {
                completion(nil)
                return
            }
            completion(weakSelf.setMaskInfoMap(with: maskStorageList))
        }
    }
    
    func setMaskInfoMap(with maskStorageList: [MaskStorage]) -> [String: Int] {
        var maskInfoMap: [String: Int] = [:]
        for maskStorage in maskStorageList {
            let county = maskStorage.maskInfo.county
            
            guard !maskStorage.maskInfo.county.isEmpty else {
                continue
            }
            if let maskCount = maskInfoMap[county] {
                maskInfoMap[county] = maskCount + maskStorage.maskInfo.adultMask
            } else {
                maskInfoMap[county] = maskStorage.maskInfo.adultMask
            }
        }
        return maskInfoMap
    }
}
