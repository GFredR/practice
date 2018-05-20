//
//  FibonacciTests.swift
//  FibonacciTests
//

import UIKit
import XCTest
import Fibonacci

class FibonacciTests: XCTestCase {
    
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
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFibinocci () {
        
        // Arrange
        let input = 5
        let model = FibonacciModel()
        let expectedResults = [1,1,2,3,5]
        
        // Act
        let result = model.calculateFibonacciNumbers(minimum2: input)
        
        // Assert
        XCTAssertTrue(result == expectedResults, "input: \(input)")
        
    }
    func testFibinocciMedium () {
        
        let input = 10
        let model = FibonacciModel()
        let expectedResults = [1,1,2,3,5,8,13,21,34,55]
        
        let result = model.calculateFibonacciNumbers(minimum2: input)
        
        XCTAssertTrue(result == expectedResults, "input: \(input)")
        
    }


    func testFibinocciTwice () {
        
        let input = 5
        let model = FibonacciModel()
        let expectedResults = [1,1,2,3,5]
        
        let result = model.calculateFibonacciNumbers(minimum2: input)
        let result2 = model.calculateFibonacciNumbers(minimum2: input)
        
        XCTAssertTrue(result == expectedResults, "input: \(input)")
        XCTAssertTrue(result2 == expectedResults, "input: \(input)")
        
    }
}
