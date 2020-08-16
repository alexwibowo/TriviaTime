//
//  Question.swift
//  TriviaTime
//
//  Created by Alex Wibowo on 16/8/20.
//  Copyright © 2020 Alex Wibowo. All rights reserved.
//

import Foundation

struct Question: Codable {
    
    let question: String
    let answers: [String]
    
    var correctAnswer: String {
        return answers[0]
    }
    
}
