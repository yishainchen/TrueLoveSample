//
//  UIViewControllerExtensionTests.swift
//  TrueLoveSampleTests
//
//  Created by CHEN YI-SHAIN on 2020/4/7.
//  Copyright © 2020 CHEN YI-SHAIN. All rights reserved.
//

import XCTest

class UIViewControllerExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testViewControllerIdentifier_WithCorrectIdentifier_ShouldReturnEqualValue() {
        XCTAssertEqual(HomePageViewController.identifier, "HomePageViewController")
    }
    
    func testViewControllerIdentifier_WithIncorrectIdentifier_ShouldReturnNotEqualValue() {
        XCTAssertNotEqual(HomePageViewController.identifier, "ViewController")
    }
    
    func testViewIdentifier_WithCorrectIdentifier_ShouldReturnEqualValue() {
        XCTAssertEqual(CountyMaskInfoTableViewCell.identifier, "CountyMaskInfoTableViewCell")
    }
    
    func testViewIdentifier_WithIncorrectIdentifier_ShouldReturnNotEqualValue() {
        XCTAssertNotEqual(CountyMaskInfoTableViewCell.identifier, "TableViewCell")
    }

}
