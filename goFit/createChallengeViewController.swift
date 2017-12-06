//
//  createChallengeViewController.swift
//  goFit
//
//  Created by Denis Russu on 11/29/17.
//  Copyright © 2017 CS147. All rights reserved.
//

import UIKit

class createChallengeViewController: UIViewController {
    
    var selectedChallenge = "NA"
    var currentFrequency  = 1;
    var selectedUser = "ME";
    
    @IBOutlet weak var swimmingButton: UIButton!
    @IBOutlet weak var runningButton: UIButton!
    @IBOutlet weak var saladButton: UIButton!
    @IBOutlet weak var walkingButton: UIButton!
    @IBOutlet weak var bikingButton: UIButton!
    @IBOutlet weak var weightsButton: UIButton!
    @IBOutlet weak var jumpropeButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    
    @IBOutlet weak var meButton: UIButton!
    @IBOutlet weak var bryceButton: UIButton!
    @IBOutlet weak var christinaButton: UIButton!
    @IBOutlet weak var denisButton: UIButton!
    
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBAction func frequencyChanged(_ sender: UIStepper) {
        frequencyLabel.text = Int(sender.value).description
        currentFrequency = Int(sender.value)
    }
    
    @IBAction func createChallenge(_ sender: UIButton) {
        //TODO: Implement users
        let newChallenge = Challenge.init(type: selectedChallenge, frequency: currentFrequency, user: selectedUser, icon: Challenge.challengesToIcons[selectedChallenge]);
        Challenge.userChallengesShared.append(newChallenge!);
        //TODO: CONGRATS screen
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func swimming(_ sender: UIButton) {
//        if swimmingButton.layer.borderColor == UIColor.green.cgColor {
//            swimmingButton.layer.borderColor = UIColor.blue.cgColor
//        } else {
//            swimmingButton.layer.borderColor = UIColor.green.cgColor
//        }
        if (swimmingButton.currentImage == #imageLiteral(resourceName: "swimming_blue"))  {
            swimmingButton.setImage(#imageLiteral(resourceName: "swimming_green"), for: UIControlState.normal)
        } else {
           swimmingButton.setImage(#imageLiteral(resourceName: "swimming_blue"), for: UIControlState.normal)
        }

        selectedChallenge = "Swimming"
    }
    @IBAction func running(_ sender: UIButton) {
        if runningButton.layer.borderColor == UIColor.green.cgColor {
            runningButton.layer.borderColor = UIColor.blue.cgColor
        } else {
            runningButton.layer.borderColor = UIColor.green.cgColor
        }
        selectedChallenge = "Running"
    }
    @IBAction func salad(_ sender: UIButton) {
        if saladButton.layer.borderColor == UIColor.green.cgColor {
            saladButton.layer.borderColor = UIColor.blue.cgColor
        } else {
            saladButton.layer.borderColor = UIColor.green.cgColor
        }
        selectedChallenge = "Salad"
    }
    @IBAction func steps(_ sender: UIButton) {
        if walkingButton.layer.borderColor == UIColor.green.cgColor {
            walkingButton.layer.borderColor = UIColor.blue.cgColor
        } else {
            walkingButton.layer.borderColor = UIColor.green.cgColor
        }
        selectedChallenge = "Walking"
    }
    @IBAction func biking(_ sender: UIButton) {
        if bikingButton.layer.borderColor == UIColor.green.cgColor {
            bikingButton.layer.borderColor = UIColor.blue.cgColor
        } else {
            bikingButton.layer.borderColor = UIColor.green.cgColor
        }
        selectedChallenge = "Biking"
    }
    @IBAction func weights(_ sender: UIButton) {
        if weightsButton.layer.borderColor == UIColor.green.cgColor {
            weightsButton.layer.borderColor = UIColor.blue.cgColor
        } else {
            weightsButton.layer.borderColor = UIColor.green.cgColor
        }
        selectedChallenge = "Weights"
    }
    @IBAction func jumprope(_ sender: UIButton) {
        if jumpropeButton.layer.borderColor == UIColor.green.cgColor {
            jumpropeButton.layer.borderColor = UIColor.blue.cgColor
        } else {
            jumpropeButton.layer.borderColor = UIColor.green.cgColor
        }
        selectedChallenge = "Jumprope"
    }
    @IBAction func water(_ sender: UIButton) {
        if waterButton.layer.borderColor == UIColor.green.cgColor {
            waterButton.layer.borderColor = UIColor.blue.cgColor
        } else {
            waterButton.layer.borderColor = UIColor.green.cgColor
        }
        selectedChallenge = "Water"
    }
    
    @IBAction func me(_ sender: UIButton) {
        if meButton.layer.borderColor == UIColor.green.cgColor {
            meButton.layer.borderColor = UIColor.blue.cgColor
        } else {
            meButton.layer.borderColor = UIColor.green.cgColor
        }
    }
    @IBAction func bryce(_ sender: UIButton) {
        if bryceButton.layer.borderColor == UIColor.green.cgColor {
            bryceButton.layer.borderColor = UIColor.blue.cgColor
        } else {
            bryceButton.layer.borderColor = UIColor.green.cgColor
            selectedUser = "Bryce";
        }
    }
    @IBAction func christina(_ sender: UIButton) {
        if christinaButton.layer.borderColor == UIColor.green.cgColor {
            christinaButton.layer.borderColor = UIColor.blue.cgColor
        } else {
            christinaButton.layer.borderColor = UIColor.green.cgColor
            selectedUser = "Christina";
        }
    }
    @IBAction func denis(_ sender: UIButton) {
        if denisButton.layer.borderColor == UIColor.green.cgColor {
            denisButton.layer.borderColor = UIColor.blue.cgColor
        } else {
            denisButton.layer.borderColor = UIColor.green.cgColor
            selectedUser = "Denis";
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swimmingButton.layer.cornerRadius = swimmingButton.frame.size.width / 2;
        swimmingButton.clipsToBounds = true;
        swimmingButton.layer.borderWidth = 5.0;
        swimmingButton.layer.borderColor = UIColor.blue.cgColor
        
        runningButton.layer.cornerRadius = runningButton.frame.size.width / 2;
        runningButton.clipsToBounds = true;
        runningButton.layer.borderWidth = 5.0;
        runningButton.layer.borderColor = UIColor.blue.cgColor
        
        saladButton.layer.cornerRadius = saladButton.frame.size.width / 2;
        saladButton.clipsToBounds = true;
        saladButton.layer.borderWidth = 5.0;
        saladButton.layer.borderColor = UIColor.blue.cgColor
        
        walkingButton.layer.cornerRadius = walkingButton.frame.size.width / 2;
        walkingButton.clipsToBounds = true;
        walkingButton.layer.borderWidth = 5.0;
        walkingButton.layer.borderColor = UIColor.blue.cgColor
        
        bikingButton.layer.cornerRadius = bikingButton.frame.size.width / 2;
        bikingButton.clipsToBounds = true;
        bikingButton.layer.borderWidth = 5.0;
        bikingButton.layer.borderColor = UIColor.blue.cgColor
        
        weightsButton.layer.cornerRadius = weightsButton.frame.size.width / 2;
        weightsButton.clipsToBounds = true;
        weightsButton.layer.borderWidth = 5.0;
        weightsButton.layer.borderColor = UIColor.blue.cgColor
        
        jumpropeButton.layer.cornerRadius = jumpropeButton.frame.size.width / 2;
        jumpropeButton.clipsToBounds = true;
        jumpropeButton.layer.borderWidth = 5.0;
        jumpropeButton.layer.borderColor = UIColor.blue.cgColor
        
        waterButton.layer.cornerRadius = waterButton.frame.size.width / 2;
        waterButton.clipsToBounds = true;
        waterButton.layer.borderWidth = 5.0;
        waterButton.layer.borderColor = UIColor.blue.cgColor
        
        meButton.layer.cornerRadius = meButton.frame.size.width / 2;
        meButton.clipsToBounds = true;
        meButton.layer.borderWidth = 5.0;
        meButton.layer.borderColor = UIColor.blue.cgColor
        
        bryceButton.layer.cornerRadius = bryceButton.frame.size.width / 2;
        bryceButton.clipsToBounds = true;
        bryceButton.layer.borderWidth = 5.0;
        bryceButton.layer.borderColor = UIColor.blue.cgColor
        bryceButton.setImage(#imageLiteral(resourceName: "bryce"), for: UIControlState.normal)
        
        christinaButton.layer.cornerRadius = christinaButton.frame.size.width / 2;
        christinaButton.clipsToBounds = true;
        christinaButton.layer.borderWidth = 5.0;
        christinaButton.layer.borderColor = UIColor.blue.cgColor
        christinaButton.setImage(#imageLiteral(resourceName: "christina"), for: UIControlState.normal)
        
        denisButton.layer.cornerRadius = denisButton.frame.size.width / 2;
        denisButton.clipsToBounds = true;
        denisButton.layer.borderWidth = 5.0;
        denisButton.layer.borderColor = UIColor.blue.cgColor
        denisButton.setImage(#imageLiteral(resourceName: "denis"), for: UIControlState.normal)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
