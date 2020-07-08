//
//  Question.swift
//  QuizEngine
//
//  Created by Fedor Valiavko on 7/8/20.
//  Copyright © 2020 Fedor Valiavko. All rights reserved.
//

import Foundation

struct Question {
    private let id: String
    
    init(id: String) {
        self.id = id
    }
}

// MARK: - Public Methods

extension Question {
    func getId() -> String {
        return id
    }
}

// MARK: - Hashable

extension Question: Hashable {
    static func == (lhs: Question, rhs: Question) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
