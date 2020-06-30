//
//  Router.swift
//  QuizEngine
//
//  Created by Fedor Valiavko on 6/30/20.
//  Copyright © 2020 Fedor Valiavko. All rights reserved.
//

import Foundation

protocol Router {
    typealias AnswerCallback = (String) -> Void
    
    func routeTo(question: String, answerCallback: @escaping AnswerCallback)
}
