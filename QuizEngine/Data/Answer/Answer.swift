//
//  Answer.swift
//  QuizEngine
//
//  Created by Fedor Valiavko on 7/8/20.
//  Copyright © 2020 Fedor Valiavko. All rights reserved.
//

import Foundation

struct Answer {
    private let id: String
    
    init(id: String) {
        self.id = id
    }
}

// MARK: - Public Methods

extension Answer {
    func getId() -> String {
        return id
    }
}

// MARK: - Hashable

extension Answer: Hashable {
    static func == (lhs: Answer, rhs: Answer) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
