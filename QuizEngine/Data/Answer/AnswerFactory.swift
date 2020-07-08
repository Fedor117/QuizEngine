//
//  AnswerFactory.swift
//  QuizEngine
//
//  Created by Fedor Valiavko on 7/8/20.
//  Copyright © 2020 Fedor Valiavko. All rights reserved.
//

import Foundation

final class AnswerFactory: EntityFactory {
    typealias Result = Answer
    
    func make(withId id: String) -> Result {
        return Answer(id: id)
    }
    
    func makeList(_ ids: [String]) -> [Result] {
        var answers = [Result]()
        for id in ids {
            answers.append(Answer(id: id))
        }
        
        return answers
    }
}
