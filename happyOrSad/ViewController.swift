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
    
    @IBOutlet weak var labelOutlet: UILabel!
    
    var emotion = 0
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Analyze text
    @IBAction func analyze(_ sender: Any) {
        
        guard let message = messageInput.text else {
            labelOutlet.text = "Enter a Message"
            return
        }
        
        if message.count >= 255 {
            labelOutlet.text = "Message to long. Must no more then 255"
        }
        
        
    }
    

}

