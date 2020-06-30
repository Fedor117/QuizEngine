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
    
    // MARK: - Inner Classes

    class RouterSpy: Router {
        var routedQuestions = [String]()
        var answerCallback: Router.AnswerCallback = { _ in }
        
        func routeTo(question: String, answerCallback: @escaping Router.AnswerCallback) {
            routedQuestions.append(question)
            self.answerCallback = answerCallback
        }
    }
    
    let router = RouterSpy()
    
    // MARK: - Helper Methods
    
    func makeSUT(questions: [String]) -> Flow {
        return Flow(router: router, questions: questions)
    }
    
    // MARK: - Tests
    
    func test_start_withNoQuestions_doesntRouteToQuestion() {
        let sut = makeSUT(questions: [])
        
        sut.start()
        
        XCTAssertTrue(router.routedQuestions.isEmpty)
    }
    
    func test_start_withOneQuestion_routesToCorrectQuestion() {
        let questions = ["Q1"]
        let sut = makeSUT(questions: questions)
        
        sut.start()
        
        XCTAssertEqual(router.routedQuestions, questions)
    }
    
    func test_start_withTwoQuestions_routesToFirstQuestion() {
        let questions = ["Q1", "Q2"]
        let sut = makeSUT(questions: questions)
        
        sut.start()
        
        XCTAssertEqual(router.routedQuestions, [questions[0]])
    }
    
    func test_startTwice_withTwoQuestions_routesToFirstQuestionTwice() {
        let questions = ["Q1", "Q2"]
        let sut = makeSUT(questions: questions)
        
        sut.start()
        sut.start()
        
        XCTAssertEqual(router.routedQuestions, [questions[0], questions[0]])
    }
    
    func test_startAndAnswerFirstQuestion_withOneQuestions_doesntRouteToAnotherQuestion() {
        let questions = ["Q1"]
        let sut = makeSUT(questions: questions)
        
        sut.start()

        router.answerCallback("A1")
        
        XCTAssertEqual(router.routedQuestions, questions)
    }
    
    func test_startAndAnswerFirstQuestion_withTwoQuestions_routesToSecondQuestion() {
        let questions = ["Q1", "Q2"]
        let sut = makeSUT(questions: questions)
        
        sut.start()

        router.answerCallback("A1")
        
        XCTAssertEqual(router.routedQuestions, questions)
    }
    
    func test_startAndAnswerFirstAndSecondQuestion_withThreeQuestions_routesToSecondAndThirdQuestion() {
        let questions = ["Q1", "Q2", "Q3"]
        let sut = makeSUT(questions: questions)
        
        sut.start()

        router.answerCallback("A1")
        router.answerCallback("A2")
        
        XCTAssertEqual(router.routedQuestions, questions)
    }
}
