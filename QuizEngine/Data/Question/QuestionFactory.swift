//
//  QuestionFactory.swift
//  QuizEngine
//
//  Created by Fedor Valiavko on 7/8/20.
//  Copyright © 2020 Fedor Valiavko. All rights reserved.
//

import Foundation

final class QuestionFactory: EntityFactory {
    typealias Result = Question
    
    func make(withId id: String) -> Result {
        return Question(id: id)
    }
    
    func makeList(_ ids: [String]) -> [Result] {
        var questions = [Result]()
        for id in ids {
            questions.append(Question(id: id))
        }
        
        return questions
    }
}
