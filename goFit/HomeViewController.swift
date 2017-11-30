//
//  ViewController.swift
//  goFit
//
//  Created by Denis Russu on 11/13/17.
//  Copyright © 2017 CS147. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var currentChallenge: UIImageView!
    
    @IBOutlet weak var challenges: UIButton!
    @IBOutlet weak var social: UIButton!
    
    @IBOutlet weak var progress: UILabel!
    @IBOutlet weak var goal: UILabel!
    
    @IBAction func minus() {
        let progressValue = Int(progress.text!)!
        if progressValue > 0 {
            progress.text = String(progressValue - 1)
        }
    }
    
    @IBAction func plus() {
        let progressValue = Int(progress.text!)!
        if progressValue < Int(goal.text!)! {
            progress.text = String(progressValue + 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentChallenge.layer.cornerRadius = currentChallenge.frame.size.width / 2;
        currentChallenge.clipsToBounds = true;
        
        currentChallenge.layer.borderWidth = 10.0;
        currentChallenge.layer.borderColor = UIColor.green.cgColor
        
    }


}

