//
//  Utils.swift
//  TriviaTime
//
//  Created by Alex Wibowo on 16/8/20.
//  Copyright © 2020 Alex Wibowo. All rights reserved.
//

import Foundation

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
