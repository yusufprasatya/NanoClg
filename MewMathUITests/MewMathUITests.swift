//
//  MewMathUITests.swift
//  MewMathUITests
//
//  Created by Muhammad Yusuf on 18/08/23.
//

import XCTest

final class MewMathUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testMainScreen() {
        let catHeadImage = app.images["Cat-head"]
        let catBodyImage = app.images["Cat-body"]
        let ballon1 = app.images["Ballon1"]
        let ballon2 = app.images["Ballon2"]
        let landMainImage = app.images["LandMain"]
        let element2 = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element = element2.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .image).matching(identifier: "Cloud").element(boundBy: 1).tap()
        element.children(matching: .image).matching(identifier: "Cloud").element(boundBy: 2).tap()
        let cloudImage = element.children(matching: .image).matching(identifier: "Cloud").element(boundBy: 0)
        
        XCTAssertTrue(catHeadImage.exists)
        XCTAssertTrue(catBodyImage.exists)
        XCTAssertTrue(ballon1.exists)
        XCTAssertTrue(ballon2.exists)
        XCTAssertTrue(landMainImage.exists)
        XCTAssertTrue(cloudImage.exists)
        XCTAssertTrue(cloudImage.exists)
    }
    
    func testButtonPlay() {
        app.buttons["Play"].tap()
        let imageCatMapExists = app.images["CatMap"].exists
        let imageTree1Exists = app.images["Tree1"].exists
        let imageTree2Exists = app.images["Tree2"].exists
        let imageTree3Exists = app.images["Tree3"].exists
        let imageTree4Exists = app.images["Tree4"].exists
        
        let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .staticText).matching(identifier: "🔒").element(boundBy: 0).tap()
        element.children(matching: .image).matching(identifier: "CatFootPrint").element(boundBy: 0).tap()
        element.children(matching: .image).matching(identifier: "CatFootPrint").element(boundBy: 2).tap()
        element.children(matching: .image).matching(identifier: "CatFootPrint").element(boundBy: 1).tap()
        element.children(matching: .image).matching(identifier: "CatFootPrint").element(boundBy: 3).tap()
            
        print("Masoook shini")
        XCTAssertTrue(imageCatMapExists)
        XCTAssertTrue(imageTree1Exists)
        XCTAssertTrue(imageTree2Exists)
        XCTAssertTrue(imageTree3Exists)
        XCTAssertTrue(imageTree4Exists)
        XCTAssertTrue(element.exists)
    }
    
//    func testQuestion1ScreenAndBehavior() {
//        app.buttons["Play"].tap()
//        app.buttons["Bola Wol"].tap()
//
//        let element = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
//        element.children(matching: .image).matching(identifier: "BallFill").element(boundBy: 0).tap()
//        element.children(matching: .image).matching(identifier: "BallFill").element(boundBy: 1)/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//
//        let ballfillImage = element.children(matching: .image).matching(identifier: "BallFill").element(boundBy: 2)
//        ballfillImage.swipeUp()
//        ballfillImage.swipeUp()
//        element.children(matching: .image).matching(identifier: "BallFill").element(boundBy: 3)/*@START_MENU_TOKEN@*/.swipeLeft()/*[[".swipeUp()",".swipeLeft()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        app.buttons["4"].tap()
//        element.children(matching: .image).matching(identifier: "BallFillGreen").element(boundBy: 1).swipeUp()
//        element.children(matching: .image).matching(identifier: "BallFillGreen").element(boundBy: 0)/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        app.buttons["2"].tap()
//        app.buttons["+"].tap()
//        app.buttons["6"].tap()
//        app.buttons["PEMBAHASAN"].tap()
//
//    }
    
    func testQuestionView() {
        app.buttons["Play"].tap()
        
        let startQuestions = app.buttons["Bola Wol"].exists
        
        if (startQuestions){
            app.buttons["Bola Wol"].tap()
            
            let element2 = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
            let element = element2.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
            let ballfillImage = element.children(matching: .image).matching(identifier: "BallFill").element(boundBy: 0)
            ballfillImage.tap()
            ballfillImage.tap()
            ballfillImage.swipeUp()
            element.children(matching: .image).matching(identifier: "BallFill").element(boundBy: 1).swipeUp()
            element.children(matching: .image).matching(identifier: "BallFill").element(boundBy: 2).swipeUp()
            element.children(matching: .image).matching(identifier: "BallFill").element(boundBy: 3)/*@START_MENU_TOKEN@*/.swipeLeft()/*[[".swipeUp()",".swipeLeft()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            
            XCTAssertTrue(element.exists)
            XCTAssertTrue(ballfillImage.exists)
            
            let button4 = app.buttons["4"]
            print("This is button 4 \(button4)")
            if (button4.exists) {
                button4.tap()
                print("Masroook")
                element.children(matching: .image).matching(identifier: "BallFillGreen").element(boundBy: 1).tap()
                element.children(matching: .image).matching(identifier: "BallFillGreen").element(boundBy: 0)/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            }
            
            let button2 = app.buttons["2"]
            if (button2.exists) {
                button2.tap()
            }
            
            let assignmentOperator = app.buttons["+"]
            let button6 = app.buttons["6"]
            
            if (assignmentOperator.exists) {
                print("Assignment here")
                assignmentOperator.tap()
            }
            
            if (button6.exists) {
                print("Button 6")
                button6.tap()
            }
        }
        
       
//        app.buttons["PEMBAHASAN"].tap()
        
    }
}
