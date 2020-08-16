//
//  QuestionViewController.swift
//  TriviaTime
//
//  Created by Alex Wibowo on 16/8/20.
//  Copyright © 2020 Alex Wibowo. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    
    
    var currentQuestion: Question? {
        didSet {
            questionLabel.text = currentQuestion!.question
            let answers = currentQuestion!.answers.shuffled()           
            answerA.setTitle("A \(answers[0])", for: .normal)
            answerB.setTitle("B \(answers[1])", for: .normal)
            answerC.setTitle("C \(answers[2])", for: .normal)
            answerD.setTitle("D \(answers[3])", for: .normal)
            
        }
    }
   
    @IBAction func answerChosen(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                    
        
        if let questionSet = QuestionSet.load(from: "set1") {
            let question = questionSet.randomQuestion()
            self.currentQuestion = question
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
