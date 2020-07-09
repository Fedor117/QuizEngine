//
//  Flow.swift
//  QuizEngine
//
//  Created by Fedor Valiavko on 6/30/20.
//  Copyright © 2020 Fedor Valiavko. All rights reserved.
//

import Foundation

final class Flow {
    private let router: Router
    private let questions: [Question]

    private var result = [Question: Answer]()
    
    init(router: Router, questions: [Question]) {
        self.router = router
        self.questions = questions
    }
    
    func start() {
        if let firstQuestion = questions.first {
            router.routeTo(question: firstQuestion, answerCallback: routeNext(from: firstQuestion))
        } else {
            router.routeTo(result: result)
        }
    }
    
    private func routeNext(from question: Question) -> Router.AnswerCallback {
        return { [weak self] answer in
            if let self = self {
                self.routeNext(from: question, answer: answer)
            }
        }
    }
    
    private func routeNext(from question: Question, answer: Answer) {
        guard let questionIndex = questions.firstIndex(of: question) else {
            router.routeTo(result: result)
            return // invalid question
        }
        
        result[question] = answer

        let nextQuestionIndex = questionIndex + 1
        if nextQuestionIndex >= questions.count {
            router.routeTo(result: result)
            return // no more questions
        }
        
        let nextQuestion = questions[nextQuestionIndex]
        router.routeTo(question: nextQuestion, answerCallback: routeNext(from: nextQuestion))
    }
}
