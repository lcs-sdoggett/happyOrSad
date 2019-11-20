//
//  ViewController.swift
//  happyOrSad
//
//  Created by Doggett, Scott on 2019-11-18.
//  Copyright © 2019 Doggett, Scott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    // Outlets
    @IBOutlet weak var messageInput: UITextField!
    
    @IBOutlet weak var outputResult: UILabel!
    
    var emotion = 0
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Analyze text
    @IBAction func analyze(_ sender: Any) {
        
        // Reset var emotion
        emotion = 0
        
        // Unwarp messageInput
        guard let phraseInput = messageInput.text, !phraseInput.isEmpty else {
            outputResult.text = "Enter a Message"
            return
        }
        
        // Check if its more then 255 characters
        if phraseInput.count >= 255 {
            outputResult.text = "Message to long. Must no more then 255"
            return
        }
        
        for character in phraseInput {
            
            switch character {
            case "😃", "😊", "🙂", "😄" :
                emotion += 1
            case "☹", "🙁", "😕", "😔":
                emotion -= 1
            default:
                outputResult.text = "None"
        }
            if emotion > 0 {
                outputResult.text = "happy"
            } else if emotion < 0 {
                outputResult.text = "sad"
            } else if emotion == 0 {
                outputResult.text = "unsure"
            }

    }
    

}

}
