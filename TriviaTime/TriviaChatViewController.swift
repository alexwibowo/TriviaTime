//
//  TriviaChatViewController.swift
//  TriviaTime
//
//  Created by Alex Wibowo on 18/8/20.
//  Copyright © 2020 Alex Wibowo. All rights reserved.
//

import UIKit
import ReverseExtension

class TriviaChatViewController: UIViewController {
    
    @IBOutlet weak var chatTableView: UITableView!
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    
    fileprivate var messages: [MessageModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatTableView.dataSource = self
        
        chatTableView.register(UINib(nibName: "ChatMessage", bundle: nil), forCellReuseIdentifier: "Cell")
        
        chatTableView.re.delegate = self
        chatTableView.re.scrollViewDidReachTop = { scrollView in
            print("scrollViewDidReachTop")
        }
        chatTableView.re.scrollViewDidReachBottom = { scrollView in
            print("scrollViewDidReachBottom")
        }
        
        chatTableView.estimatedRowHeight = 56
        chatTableView.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction func nextQuestion(_ sender: UIBarButtonItem) {
        messages.append(MessageModel())
        chatTableView.beginUpdates()
        chatTableView.re.insertRows(at: [IndexPath(row: messages.count - 1, section: 0)], with: .automatic)
        chatTableView.endUpdates()
    }
    
}

extension TriviaChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        (cell as? ChatMessage)?.configure(with: messages[indexPath.row])
        return cell
    }
}



extension TriviaChatViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollView.contentOffset.y =", scrollView.contentOffset.y)
    }
}

