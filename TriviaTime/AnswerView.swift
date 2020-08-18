//
//  AnswerView.swift
//  TriviaTime
//
//  Created by Alex Wibowo on 17/8/20.
//  Copyright © 2020 Alex Wibowo. All rights reserved.
//

import UIKit

class AnswerView: UIView {
    
    var correctAnswer = false
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var button: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("Hey there")
    }
    
    private func customInit() {
        let nib = UINib(nibName: "Answer", bundle: nil)
        if let view = nib.instantiate(withOwner: self,
                                      options: nil).first as? UIView {
            addSubview(view)
            view.frame = self.bounds
        }
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
