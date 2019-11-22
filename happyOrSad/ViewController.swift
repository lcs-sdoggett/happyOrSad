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
    
    var emojiCount = 0
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Analyze text
    @IBAction func analyze(_ sender: Any) {
        
        // Reset var emotion
        emotion = 0
        
        emojiCount = 0
        
        // Unwarp messageInput
        guard let phraseInput = messageInput.text, !phraseInput.isEmpty else {
            outputResult.text = "Enter a Message"
            return
        }
        
        // Check if its more then 255 characters
        if phraseInput.count >= 255 {
            outputResult.text = "Please enter a string with at least 1 and no more than 255 characters."
            return
        }
        
        // Loop through each character and check if its either a smiley face or sad face
        // Change variable emotion based on the expression of the emoji
        // If there are n emotions, output will be "none"
        for character in phraseInput {
            
            switch character {
            case "😃", "😊", "🙂", "😄" :
                emotion += 1
                emojiCount += 1
            case "☹", "🙁", "😕", "😔":
                emotion -= 1
                emojiCount += 1
            default:
                outputResult.text = "none"
                
            }
            
        }
        
        // Output either "happy" or "sad" depending on the value of emotion
        // If emotions is zero but there have been emojis, then it is none, else it is unsure
        if emotion > 0 {
            outputResult.text = "happy"
            
        } else if emotion < 0 {
            outputResult.text = "sad"
            
        } else if emotion == 0 && emojiCount != 0 {
            outputResult.text = "unsure"
            
        }
        
    }
    
}
