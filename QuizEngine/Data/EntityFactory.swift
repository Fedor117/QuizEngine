//
//  EntityFactory.swift
//  QuizEngine
//
//  Created by Fedor Valiavko on 7/8/20.
//  Copyright © 2020 Fedor Valiavko. All rights reserved.
//

import Foundation

protocol EntityFactory {
    associatedtype Result
    
    func make(withId id: String) -> Result?
    func makeList(_ ids: [String]) -> [Result]
}
