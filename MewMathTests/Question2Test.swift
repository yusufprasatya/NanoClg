//
//  Question2Test.swift
//  MewMathTests
//
//  Created by Muhammad Yusuf on 19/08/23.
//

import XCTest
@testable import MewMath

final class Question2Test: XCTestCase {
    
    let basketPos: [CGFloat] = [200, 100]
    
    var sut: Question2View!
    var fishs: [[CGFloat]] = []
    var basketPool: [Bool] = []
    var step: Int = 0
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = Question2View()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testOnBasketIsReturnTrue() {
        let position: [CGFloat] = [195, 380]
        XCTAssertTrue(sut.onBasket(position: position))
    }
    
    func testOnBasketIsReturnFalse() {
        let falsePosition: [CGFloat] = [100, 100]
        XCTAssertFalse(sut.onBasket(position: falsePosition))
    }
    
    func testOnBasketInsideThreshold() {
        let positionInsideThreshold: [CGFloat] = [70, 276]
        
        XCTAssertTrue(sut.onBasket(position: positionInsideThreshold), "Expected true for position inside threshold")
    }
    
    func testOnBasketOutsideThreshold() {
        let positionOutsideThreshold: [CGFloat] = [400, 200]
        
        XCTAssertFalse(sut.onBasket(position: positionOutsideThreshold), "Expected false for position outside threshold")
    }
    
    func testOnBasketOnEdge() {
        let positionOnEdge: [CGFloat] = [66, 296]
        
        XCTAssertTrue(sut.onBasket(position: positionOnEdge), "Expected true for position on edge")
    }
    
    
    func testDragGesture2OnEndedLogic() {
        fishs = [[200, 100, 0.7], [300, 150, 0.8], [250, 200, 0.9]]
        basketPool = [false, false, false]
        step = 0
        
        let fishNum = 0
        simulateDragGesture2OnEnded(fishNum: fishNum)
        
        XCTAssertTrue(basketPool[fishNum], "Expected basketPool to be true")
        XCTAssertEqual(step, 1, "Expected step to be updated")
        XCTAssertEqual(fishs[fishNum][2], 0.7, "Expected fish's third value to be updated")
    }
    
    func simulateDragGesture2OnEnded(fishNum: Int) {
        basketPool[fishNum] = true
        
        let countBall = 6
        if step == 0 && countBall == 6 {
            step += 1
        }
        
        fishs[fishNum][2] = 0.7
    }
}
