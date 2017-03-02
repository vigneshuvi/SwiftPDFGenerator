//
//  SwiftPDFGeneratorTests.swift
//  SwiftPDFGeneratorTests
//
//  Created by Vigneshuvi on 28/02/17.
//  Copyright © 2017 vigneshuvi. All rights reserved.
//

import XCTest
@testable import SwiftPDFGenerator

class SwiftPDFGeneratorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
         self.createInvoiceAsHTML();
    }
    
    func createInvoiceAsHTML() {
        let filePath:String = samplePDF()
        XCTAssertNotNil(filePath, "File Path cann't be nil")
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
          
        }
    }
    
}
