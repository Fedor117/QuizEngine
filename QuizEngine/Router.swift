//
//  Router.swift
//  QuizEngine
//
//  Created by Fedor Valiavko on 6/30/20.
//  Copyright © 2020 Fedor Valiavko. All rights reserved.
//

import Foundation

protocol Router {
    typealias AnswerCallback = (Answer) -> Void
    
    func routeTo(question: Question, answerCallback: @escaping AnswerCallback)
}
