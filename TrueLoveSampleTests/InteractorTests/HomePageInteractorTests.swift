//
//  HomePageInteractorTests.swift
//  TrueLoveSampleTests
//
//  Created by CHEN YI-SHAIN on 2020/4/7.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import XCTest

class HomePageInteractorTests: XCTestCase {
    
    var interactor: HomePageInteractor!
    var maskInfoServiceMock: MaskInfoServiceMock!

    override func setUp() {
        super.setUp()
        maskInfoServiceMock = MaskInfoServiceMock()
        self.interactor = HomePageDefaultInteractor(maskInfoService: maskInfoServiceMock)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCountyMaskCount_ShouldReturnCountyMaskSum() {
        let maskInfoMap = interactor.setMaskInfoMap(with: generateFakeMaskStorageList())
        XCTAssertEqual(maskInfoMap["臺北市"], 430)
        XCTAssertNotEqual(maskInfoMap["臺北市"], 400)
        XCTAssertEqual(maskInfoMap["高雄市"], 100)
        XCTAssertNotEqual(maskInfoMap["高雄市"], 130)
    }

    func testCountyMaskCount_WithIncorrectInfo_ShouldReturnNil() {
        let maskInfoMap = interactor.setMaskInfoMap(with: generateFakeMaskStorageListWithIncorrectInfo())
        XCTAssertNil(maskInfoMap[""])
    }
    
}

extension HomePageInteractorTests {
    func generateFakeMaskStorageList() -> [MaskStorage] {
        let maskinfo1 = MaskInfo(id: "12345", name: "誠實藥局", adultMask: 130, county: "臺北市")
        let maskStorage1 = MaskStorage(maskInfo: maskinfo1)
        
        let maskinfo2 = MaskInfo(id: "12347", name: "簡單藥局", adultMask: 100, county: "高雄市")
        let maskStorage2 = MaskStorage(maskInfo: maskinfo2)
        
        let maskinfo3 = MaskInfo(id: "12348", name: "隔壁藥局", adultMask: 300, county: "臺北市")
        let maskStorage3 = MaskStorage(maskInfo: maskinfo3)
        
        return [maskStorage1, maskStorage2, maskStorage3]
    }
    
    func generateFakeMaskStorageListWithIncorrectInfo() -> [MaskStorage] {
        let maskinfo = MaskInfo(id: "", name: "", adultMask: 120, county: "")
        let maskStorage = MaskStorage(maskInfo: maskinfo)
        
        return [maskStorage]
    }
}
