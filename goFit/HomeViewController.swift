//
//  ViewController.swift
//  goFit
//
//  Created by Denis Russu on 11/13/17.
//  Copyright © 2017 CS147. All rights reserved.
//

import UIKit
import MBCircularProgressBar
import SAConfettiView

class HomeViewController: UIViewController {
    
    @IBOutlet weak var currentChallenge: UIImageView!
    
    @IBOutlet weak var challengesImage: UIImageView!
    @IBOutlet weak var challenges: UIButton!
    @IBOutlet weak var social: UIButton!
    
    @IBOutlet weak var progressBar: MBCircularProgressBarView!
    @IBOutlet weak var progress: UILabel!
    @IBOutlet weak var goal: UILabel!
    
    @IBOutlet weak var currentChallengeLabel: UILabel!
    
    var currentInt = 0;
    var progressVal = 2;
    var goalVal = 4;
    
    var confettiView = SAConfettiView()
    //var fitBlue =
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    @IBAction func minus() {
     }
    
    @IBAction func plus() {
        let curChallenge = Challenge.userChallengesShared[currentInt]
        if (curChallenge.progress < curChallenge.frequency) {
          curChallenge.progress += 1
        }
        progress.text = String(curChallenge.progress)
        UIView.animate(withDuration: 2.0, animations: { 
            self.progressBar.value = CGFloat(curChallenge.progress)
            if (curChallenge.progress == curChallenge.frequency) {
                self.view.addSubview(self.confettiView)
                self.confettiView.startConfetti()
                self.progressBar.progressColor = UIColor.green
                Challenge.moveCompletedToEnd(intToMove: self.currentInt)
            }
        }) { (finished) in
            if (curChallenge.progress == curChallenge.frequency) {
            if (self.currentInt + 1 < Challenge.userChallengesShared.count) {
                self.currentInt+=1;
                let newChallenge = Challenge.userChallengesShared[self.currentInt]
                self.currentChallengeLabel.text = newChallenge.type;
                self.currentChallenge.image = newChallenge.icon!
                self.progressVal = newChallenge.progress
                self.goalVal = newChallenge.frequency
                self.progress.text = String(self.progressVal)
                self.goal.text = String(self.goalVal)
                if (self.progressVal == self.goalVal) {
                    self.progressBar.progressColor = UIColor.green
                }
                else {
                    self.progressBar.progressColor = self.hexStringToUIColor(hex: "00ffff")
                }
                self.progressBar.value = CGFloat(self.progressVal)
                self.progressBar.maxValue = CGFloat(self.goalVal)
                
            }
            self.confettiView.stopConfetti()
            self.confettiView.removeFromSuperview()
            }
            print("updated!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confettiView = SAConfettiView(frame: self.view.bounds)
        
//        challengesImage.layer.borderColor = UIColor.green.cgColor;
//        challengesImage.layer.cornerRadius = 50;
//        challengesImage.clipsToBounds = true;
//        challengesImage.layer.borderWidth = 2.0;
        
        let newChallenge = Challenge.userChallengesShared[currentInt]
        currentChallengeLabel.text = newChallenge.type;
        currentChallenge.image = newChallenge.icon!
        progressVal = newChallenge.progress
        goalVal = newChallenge.frequency
        progress.text = String(progressVal)
        goal.text = String(goalVal)
        
        if (progressVal == goalVal) {
            progressBar.progressColor = UIColor.green
            //self.view.addSubview(confettiView)
        }
        else {
            progressBar.progressColor = hexStringToUIColor(hex: "00ffff")
        }
        progressBar.value = CGFloat(progressVal)
        progressBar.maxValue = CGFloat(goalVal)
        
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
            if (progressVal == goalVal) {
                progressBar.progressColor = UIColor.green
            }
            else {
                progressBar.progressColor = hexStringToUIColor(hex: "00ffff")
            }
            progressBar.value = CGFloat(progressVal)
            progressBar.maxValue = CGFloat(goalVal)
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
            if (progressVal == goalVal) {
                progressBar.progressColor = UIColor.green
            }
            else {
                progressBar.progressColor = hexStringToUIColor(hex: "00ffff")
            }
        progressBar.value = CGFloat(progressVal)
        progressBar.maxValue = CGFloat(goalVal)

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(false);
    //self.navigationController?.navigationBar.isHidden = true;
    }


}

