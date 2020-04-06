//
//  HomePageInteractor.swift
//  TrueLoveSample
//
//  Created by CHEN YI-SHAIN on 2020/4/6.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import Foundation

protocol HomePageInteractor {
    func getMaskStorageInfo()
}

class HomePageDefaultInteractor: HomePageInteractor {
    
    private let maskInfoService: MaskInfoService
    
    init(maskInfoService: MaskInfoService) {
        self.maskInfoService = maskInfoService
    }
    
    func getMaskStorageInfo() {
        maskInfoService.fetchMaskStorageInfo { (maskStorageList, error) in
            guard let maskStorageList = maskStorageList else {
                return
            }
            
            
        }
    }
}
