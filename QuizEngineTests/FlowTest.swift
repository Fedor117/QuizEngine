//
//  FlowTest.swift
//  QuizEngineTests
//
//  Created by Fedor Valiavko on 6/30/20.
//  Copyright © 2020 Fedor Valiavko. All rights reserved.
//

import Foundation
import XCTest
@testable import QuizEngine

class FlowTest: XCTestCase {
    
    class RouterSpy: Router {
        var routedQuestionCount = 0
        var routedQuestion: String?
        
        func routeTo(question: String) {
            routedQuestionCount += 1
            routedQuestion = question
        }
    }
    
    func test_start_withNoQuestions_doesntRouteToQuestion() {
        let router = RouterSpy()
        let sut = Flow(router: router, questions: [])
        sut.start()
        
        XCTAssertEqual(router.routedQuestionCount, 0)
    }
    
    func test_start_withNoQuestions_routesToQuestion() {
        let router = RouterSpy()
        let questions = ["Q1"]
        let sut = Flow(router: router, questions: questions)
        sut.start()
        
        XCTAssertEqual(router.routedQuestionCount, 1)
    }
    
    func test_start_withNoQuestions_routesToCorrectQuestion() {
        let router = RouterSpy()
        let questions = ["Q1"]
        let sut = Flow(router: router, questions: questions)
        sut.start()
        
        XCTAssertEqual(router.routedQuestion, questions[0])
    }
}
