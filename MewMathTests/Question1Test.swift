//
//  MewMathTests.swift
//  MewMathTests
//
//  Created by Muhammad Yusuf on 18/08/23.
//

import XCTest
@testable import MewMath

final class Question1Test: XCTestCase {
    
    let basketPos: [CGFloat] = [200, 100]
    
    var sut: Question1View!
    var balls: [[CGFloat]] = []
    var basketPool: [Bool] = []
    var step: Int = 0
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = Question1View()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testOnBasketIsReturnTrue() {
        let position: [CGFloat] = [0, 0, 0.7]
        XCTAssertTrue(sut.onBasket(position: position))
        
    }
    
    func testOnBasketIsReturnFalse() {
        let falsePosition: [CGFloat] = [100, 100, 200, 300]
        XCTAssertFalse(sut.onBasket(position: falsePosition))
    }
    
    func testOnBasketInsideThreshold() {
        let positionInsideThreshold: [CGFloat] = [100, 20]
        
        XCTAssertTrue(sut.onBasket(position: positionInsideThreshold), "Expected true for position inside threshold")
    }
    
    func testOnBasketOutsideThreshold() {
        let positionOutsideThreshold: [CGFloat] = [400, 200]
        
        XCTAssertFalse(sut.onBasket(position: positionOutsideThreshold), "Expected false for position outside threshold")
    }
    
    func testOnBasketOnEdge() {
        let positionOnEdge: [CGFloat] = [129, 28]
        
        XCTAssertTrue(sut.onBasket(position: positionOnEdge), "Expected true for position on edge")
    }
    
    func testBallCounterWithEmptyArray() {
        let emptyArray: [Bool] = []
        
        XCTAssertEqual(sut.ballCounter(emptyArray), 0, "Expected 0 for empty array")
    }
    
    func testBallCounterWithAllFalse() {
        let allFalseArray = [false, false, false, false]
        
        XCTAssertEqual(sut.ballCounter(allFalseArray), 0, "Expected 0 for all false values")
    }
    
    func testBallCounterWithAllTrue() {
        let allTrueArray = [true, true, true, true]
        
        XCTAssertEqual(sut.ballCounter(allTrueArray), 4, "Expected 4 for all true values")
    }
    
    func testBallCounterWithMixedValues() {
        let mixedArray = [true, false, true, false]
        
        XCTAssertEqual(sut.ballCounter(mixedArray), 2, "Expected 2 for mixed values")
    }
    
    func testDragGesture() {
        print("ini drag gesture \(sut.dragGesture(ballNum: 1, dragable: true))")
        
    }
    
    func testDragGestureOnEndedLogic() {
        balls = [[200, 100, 0.7], [300, 150, 0.8], [250, 200, 0.9]]
        basketPool = [false, false, false]
        step = 0
        
        // Simulate the onEnded logic
        let ballNum = 0
        simulateDragGestureOnEnded(ballNum: ballNum)
        
        XCTAssertTrue(basketPool[ballNum], "Expected basketPool to be true")
        XCTAssertEqual(step, 1, "Expected step to be updated")
        XCTAssertEqual(balls[ballNum][2], 0.7, "Expected ball's third value to be updated")
    }
    
    func simulateDragGestureOnEnded(ballNum: Int) {
        basketPool[ballNum] = true
        
        let countBall = 4
        if step == 0 && countBall == 4 {
            step += 1
        }
        
        balls[ballNum][2] = 0.7
    }
}
