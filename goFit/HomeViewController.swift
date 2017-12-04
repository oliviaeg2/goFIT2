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
    
    @IBOutlet weak var currentChallengeLabel: UILabel!
    
    var currentInt = 0;
    var progressVal = 2;
    var goalVal = 4;
    
    @IBAction func minus() {
     }
    
    @IBAction func plus() {
//        let progressValue = Int(progress.text!)!
//        if progressValue < Int(goal.text!)! {
//            progress.text = String(progressValue + 1)
//        }
        let curChallenge = Challenge.userChallengesShared[currentInt]
        if (curChallenge.progress < curChallenge.frequency) {
          curChallenge.progress += 1
        }
        progress.text = String(curChallenge.progress)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newChallenge = Challenge.userChallengesShared[currentInt]
        currentChallengeLabel.text = newChallenge.type;
        currentChallenge.image = newChallenge.icon!
        progressVal = newChallenge.progress
        goalVal = newChallenge.frequency
        progress.text = String(progressVal)
        goal.text = String(goalVal)
        
        
        currentChallenge.layer.cornerRadius = currentChallenge.frame.size.width / 2;
        currentChallenge.clipsToBounds = true;
        
        currentChallenge.layer.borderWidth = 10.0;
        currentChallenge.layer.borderColor = UIColor.green.cgColor
        
    }
    
    @IBAction func touchedPrevious(_ sender: Any) {
        if (currentInt - 1 >= 0) {
            currentInt-=1;
            let newChallenge = Challenge.userChallengesShared[currentInt]
            currentChallengeLabel.text = newChallenge.type;
            currentChallenge.image = newChallenge.icon!
            progressVal = newChallenge.progress
            goalVal = newChallenge.frequency
            progress.text = String(progressVal)
            goal.text = String(goalVal)
        }
    }
    
    @IBAction func touchedNext(_ sender: Any) {
      
        if (currentInt + 1 < Challenge.userChallengesShared.count) {
        currentInt+=1;
        let newChallenge = Challenge.userChallengesShared[currentInt]
        currentChallengeLabel.text = newChallenge.type;
        currentChallenge.image = newChallenge.icon!
        progressVal = newChallenge.progress
        goalVal = newChallenge.frequency
        progress.text = String(progressVal)
        goal.text = String(goalVal)

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(false);
    //self.navigationController?.navigationBar.isHidden = true;
    }


}

