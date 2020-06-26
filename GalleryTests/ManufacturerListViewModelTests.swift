//
//  ManufacturerListViewModelTests.swift
//  GalleryTests
//
//  Created by merve kavaklioglu on 22.06.20.
//  Copyright © 2020 Merve Kavaklioglu. All rights reserved.
//

import XCTest
import Combine
import Alamofire
@testable import Gallery

class ManufacturerListViewModelTests: XCTestCase {
    private var sut: ManufacturerListViewModel!
    var view: ManufacturerListView?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ManufacturerListViewModel()
        view = ManufacturerListView(viewModel: sut!)

    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_manufacturers() throws {
        
        let result = expectCompletion(of: view!.viewModel.$manufacturers)
        XCTAssertNotNil(sut.manufacturers)
        wait(for: [result.expectation], timeout: 3)
    }
    
}
extension XCTestCase {
    typealias CompetionResult = (expectation: XCTestExpectation,
        cancellable: AnyCancellable)
    func expectCompletion<T: Publisher>(of publisher: T,
                                        timeout: TimeInterval = 2,
                                        file: StaticString = #file,
                                        line: UInt = #line) -> CompetionResult {
        let exp = expectation(description: "Successful completion of " + String(describing: publisher))
        let cancellable = publisher
            .sink(receiveCompletion: { completion in
                if case .finished = completion {
                    exp.fulfill()
                }
            }, receiveValue: { _ in
                exp.fulfill()
            })
        return (exp, cancellable)
    }
}
