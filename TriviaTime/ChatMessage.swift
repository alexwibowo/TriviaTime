//
//  ChatMessage.swift
//  TriviaTime
//
//  Created by Alex Wibowo on 18/8/20.
//  Copyright © 2020 Alex Wibowo. All rights reserved.
//

import UIKit

class ChatMessage: UITableViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageContainerView.layer.cornerRadius = 8
        messageContainerView.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func configure(with message: MessageModel) {
        messageLabel.text = message.message        
    }
    
}
