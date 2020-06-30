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
    private let questions: [String]
    
    init(router: Router, questions: [String]) {
        self.router = router
        self.questions = questions
    }
    
    func start() {
        if let firstQuestion = questions.first {
            router.routeTo(question: firstQuestion, answerCallback: routeNext(from: firstQuestion))
        }
    }
    
    private func routeNext(from question: String) -> Router.AnswerCallback {
        return { [weak self] _ in
            guard let strongSelf = self else {
                return
            }
            
            guard let questionIndex = strongSelf.questions.firstIndex(of: question) else {
                return // invalid question
            }

            if strongSelf.questions.count - 1 <= questionIndex {
                return // no more questions
            }
            
            let nextQuestion = strongSelf.questions[questionIndex + 1]
            strongSelf.router.routeTo(question: nextQuestion, answerCallback: strongSelf.routeNext(from: nextQuestion))
        }
    }
}
