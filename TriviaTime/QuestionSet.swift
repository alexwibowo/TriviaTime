//
//  QuestionSets.swift
//  TriviaTime
//
//  Created by Alex Wibowo on 16/8/20.
//  Copyright © 2020 Alex Wibowo. All rights reserved.
//

import Foundation


struct QuestionSet: Codable {
    
    var questions = [Question]()
    
    init(){
        self.questions = [Question]()
    }
    
    mutating func add(question: Question){
        self.questions += [question]
    }
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    func randomQuestion() -> Question {
        return questions[questions.count.arc4random]
    }
    
    static func load(from resource: String) -> QuestionSet? {
        if let url = Bundle.main.url(forResource: resource, withExtension: "json"),
            let data = try? Data(contentsOf: url) {
            
            #if DEBUG
            let jsonString = String(data: data, encoding: .utf8)
            print("Loaded JSON:\n \(jsonString!)")
            #endif
            
            
            if let questionSet = try? JSONDecoder().decode(QuestionSet.self, from: data) {
                return questionSet
            }
        }
        return nil
    }
    
    
}
