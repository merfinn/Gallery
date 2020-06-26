//
//  AutoModelListViewModelTests.swift
//  GalleryTests
//
//  Created by merve kavaklioglu on 22.06.20.
//  Copyright © 2020 Merve Kavaklioglu. All rights reserved.
//

import XCTest
@testable import Gallery

class AutoModelListViewModelTests: XCTestCase {
    
    var sut: AutoModelListViewModel?
    
    override func setUp() {
        super.setUp()
        sut = AutoModelListViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_getAutoModels() {
        
        // Given A apiservice
        let sut = self.sut!
        
        // When fetch articles
        let result = expectCompletion(of: sut.$autoModels)
        sut.getAutoModels(manufacturerId: "040")
        XCTAssertNotNil(sut.autoModels)
        wait(for: [result.expectation], timeout: 3)
    }
}
