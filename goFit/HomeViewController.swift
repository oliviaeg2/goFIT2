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
    
    @IBOutlet weak var currentChallengeView: UIImageView!
    
    @IBOutlet weak var currentChallengeProgressBar: MBCircularProgressBarView!
    @IBOutlet weak var currentChallengeProgressLabel: UILabel!
    @IBOutlet weak var currentChallengeGoalLabel: UILabel!
    
    @IBOutlet weak var currentChallengeNameLabel: UILabel!
    @IBOutlet weak var currentChallengeUnitsLabel: UILabel!

    var currentChallengeIndex = 0;
    var currentChallengeProgressValue = 2;
    var currentChallengeGoalValue = 4;
    
    var confettiView = SAConfettiView()
    
    @IBAction func incrementCurrentChallengeProgress() {
        let currentChallenge = Challenge.userChallengesShared[currentChallengeIndex]
        if (currentChallenge.progress < currentChallenge.goal) {
          currentChallenge.progress += 1
        }
        currentChallengeProgressLabel.text = String(currentChallenge.progress)
        UIView.animate(withDuration: 2.0, animations: { 
            self.currentChallengeProgressBar.value = CGFloat(currentChallenge.progress)
            if (currentChallenge.progress == currentChallenge.goal) {
                self.view.addSubview(self.confettiView)
                self.confettiView.startConfetti()
                self.currentChallengeProgressBar.progressColor = UIColor.green
                Challenge.moveCompletedToEnd(intToMove: self.currentChallengeIndex)
            }
        }) { (finished) in
            if (currentChallenge.progress == currentChallenge.goal) {
            if (self.currentChallengeIndex + 1 < Challenge.userChallengesShared.count) {
                self.updateCurrentChallenge(to: self.currentChallengeIndex + 1)
            }
            self.confettiView.stopConfetti()
            self.confettiView.removeFromSuperview()
            }
        }
    }
    
    func updateCurrentChallenge(to index: Int) {
        currentChallengeIndex = index
        let newChallenge = Challenge.userChallengesShared[currentChallengeIndex]
        currentChallengeNameLabel.text = newChallenge.type;
        currentChallengeUnitsLabel.text = String(newChallenge.amount) + " " + newChallenge.unit
        currentChallengeView.image = newChallenge.icon!
        currentChallengeProgressValue = newChallenge.progress
        currentChallengeGoalValue = newChallenge.goal
        currentChallengeProgressLabel.text = String(currentChallengeProgressValue)
        currentChallengeGoalLabel.text = String(currentChallengeGoalValue)
        currentChallengeProgressBar.progressColor = currentChallengeProgressValue == currentChallengeGoalValue ? UIColor.green : UIColor(hex: "00ffff")
        currentChallengeProgressBar.value = CGFloat(currentChallengeProgressValue)
        currentChallengeProgressBar.maxValue = CGFloat(currentChallengeGoalValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confettiView = SAConfettiView(frame: self.view.bounds)
        updateCurrentChallenge(to: currentChallengeIndex)
    }
    
    @IBAction func touchedPrevious(_ sender: Any) {
        if (currentChallengeIndex - 1 >= 0) {
            updateCurrentChallenge(to: currentChallengeIndex - 1)
        }
    }
    
    @IBAction func touchedNext(_ sender: Any) {
        if (currentChallengeIndex + 1 < Challenge.userChallengesShared.count) {
            updateCurrentChallenge(to: currentChallengeIndex + 1)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false);
    }

}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
