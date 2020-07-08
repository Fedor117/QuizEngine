//
//  QuestionFactoryTest.swift
//  QuizEngineTests
//
//  Created by Fedor Valiavko on 7/8/20.
//  Copyright © 2020 Fedor Valiavko. All rights reserved.
//

import XCTest
@testable import QuizEngine

class QuestionFactoryTest: XCTestCase {

    func test_makeQuestion_emptyId() {
        let factory = QuestionFactory()
        XCTAssertNil(factory.make(withId: ""))
    }
    
    func test_makeQuestion_validId() {
        let factory = QuestionFactory()
        XCTAssertNotNil(factory.make(withId: "Q1"))
    }
    
    func test_makeQuestions_noIds() {
        let factory = QuestionFactory()
        let questions = factory.makeList([])
        
        XCTAssertEqual(questions.count, 0)
    }
    
    func test_makeQuestions_oneId() {
        let factory = QuestionFactory()
        let questionsIds = ["Q1"]
        let questions = factory.makeList(questionsIds)
        
        for index in 0..<questionsIds.count {
            XCTAssertEqual(questions[index].getId(), questionsIds[index])
        }
    }
    
    func test_makeQuestions_twoIds() {
        let factory = QuestionFactory()
        let questionsIds = ["Q1", "Q2"]
        let questions = factory.makeList(questionsIds)
        
        for index in 0..<questionsIds.count {
            XCTAssertEqual(questions[index].getId(), questionsIds[index])
        }
    }
}
