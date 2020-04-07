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
}

class HomePageDefaultInteractor: HomePageInteractor {
    
    private let maskInfoService: MaskInfoService
    var maskInfoMap: [String: Int] = [:] // [CountyName: MaskCount]
    
    init(maskInfoService: MaskInfoService) {
        self.maskInfoService = maskInfoService
    }
    
    func getMaskStorageInfo(_ completion: @escaping (_ maskInfoMap: [String: Int]?) -> Void) {
        maskInfoService.fetchMaskStorageInfo { [weak self] (maskStorageList, error) in
            guard let weakSelf = self, let maskStorageList = maskStorageList else {
                completion(nil)
                return
            }
            weakSelf.setMaskInfoMap(with: maskStorageList)
            completion(weakSelf.maskInfoMap)
        }
    }
    
    func setMaskInfoMap(with maskStorageList: [MaskStorage]) {
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
    }
}
