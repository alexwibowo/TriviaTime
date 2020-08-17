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
    @IBOutlet weak var answerStackView: UIStackView!

    var currentQuestion: Question? {
        didSet {
            questionLabel.text = currentQuestion!.question
            
            let shuffledAnswers = currentQuestion!.answers.shuffled()
            answerStackView.arrangedSubviews.forEach { (view) in
                view.removeFromSuperview()
            }
            
            for answer in shuffledAnswers {
                let answerView = AnswerView()
                answerView.button.setTitle(answer, for: .normal)
                answerView.correctAnswer = answer == currentQuestion!.correctAnswer
                answerStackView.addArrangedSubview(answerView)
            }
        }
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
