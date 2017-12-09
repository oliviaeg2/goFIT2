//
//  createChallengeViewController.swift
//  goFit
//
//  Created by Denis Russu on 11/29/17.
//  Copyright © 2017 CS147. All rights reserved.
//

import UIKit
import SAConfettiView

class CreateSocialChallengeViewController: UIViewController {
    
    var selectedChallenge = "NA"
    var currentFrequency  = 1;
    var selectedUser : String?
    var amount = 0;
    
    let confettiView = SAConfettiView()
    
    var distanceUnits = ["mi", "km", "min", "hr"];
    var foodUnits = ["oz", "cup"];
    var otherUnits = ["rep", "set", "min", "hr"];
    
    func changeSegmentedControl(units: [String]) {
        unitsControl.removeAllSegments();
        var i = 0;
        for unit in units {
            unitsControl.insertSegment(withTitle: unit, at: i, animated: false)
        }
        i+=1;
        unitsControl.selectedSegmentIndex = 0;
    }
    
    var distanceSelected = true;
    var foodSelected = false;
    var otherSelected = false;
    
    @IBOutlet weak var swimmingButton: UIButton!
    @IBOutlet weak var runningButton: UIButton!
    @IBOutlet weak var saladButton: UIButton!
    @IBOutlet weak var walkingButton: UIButton!
    @IBOutlet weak var bikingButton: UIButton!
    @IBOutlet weak var weightsButton: UIButton!
    @IBOutlet weak var jumpropeButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBAction func frequencyChanged(_ sender: UIStepper) {
        frequencyLabel.text = Int(sender.value).description
        currentFrequency = Int(sender.value)
    }
    
    @IBOutlet weak var unitsControl: UISegmentedControl!
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBAction func createChallenge(_ sender: UIButton) {
        let unit = unitsControl.titleForSegment(at: unitsControl.selectedSegmentIndex)
        let newChallenge = Challenge.init(type: selectedChallenge, frequency: currentFrequency, amount: amount, user: selectedUser!, icon: Challenge.challengesToIcons[selectedChallenge], unit: unit!);
        Challenge.userChallengesShared.insert(newChallenge!, at: 0);
        //TODO: CONGRATS screen
        
        for user in User.userFriendsShared {
            if (user.name == selectedUser!) {
                user.addChallenge(newChallenge: newChallenge!)
            }
        }
        
        view.addSubview(confettiView)
        confettiView.startConfetti()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            let alert = UIAlertController(title: "Congrats!", message: "Your challenge was created successfully!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Go Forth!", style: .default, handler: {(alert: UIAlertAction!) in  _ = self.navigationController?.popViewController(animated: true)
                self.confettiView.stopConfetti()
                self.confettiView.removeFromSuperview()
            }
                )
            )
            self.present(alert, animated: true)
        })
    }

    func clearChallengesSelection() {
        swimmingButton.setImage(#imageLiteral(resourceName: "swimming_blue"), for: UIControlState.normal)
        runningButton.setImage(#imageLiteral(resourceName: "running_blue"), for: UIControlState.normal)
        saladButton.setImage(#imageLiteral(resourceName: "salad_blue"), for: UIControlState.normal)
        walkingButton.setImage(#imageLiteral(resourceName: "walking_blue"), for: UIControlState.normal)
        bikingButton.setImage(#imageLiteral(resourceName: "biking_blue"), for: UIControlState.normal)
        weightsButton.setImage(#imageLiteral(resourceName: "weights_blue"), for: UIControlState.normal)
        jumpropeButton.setImage(#imageLiteral(resourceName: "jumprope_blue"), for: UIControlState.normal)
        waterButton.setImage(#imageLiteral(resourceName: "water_blue"), for: UIControlState.normal)
    }
    
    @IBAction func swimming(_ sender: UIButton) {
        clearChallengesSelection()
        if (swimmingButton.currentImage == #imageLiteral(resourceName: "swimming_blue"))  {
            swimmingButton.setImage(#imageLiteral(resourceName: "swimming_green"), for: UIControlState.normal)
        } else {
            swimmingButton.setImage(#imageLiteral(resourceName: "swimming_blue"), for: UIControlState.normal)
        }
        selectedChallenge = "Swimming"
        changeSegmentedControl(units: distanceUnits);
    }
    
    @IBAction func running(_ sender: UIButton) {
        clearChallengesSelection()
        if (runningButton.currentImage == #imageLiteral(resourceName: "running_blue"))  {
            runningButton.setImage(#imageLiteral(resourceName: "running_green"), for: UIControlState.normal)
        } else {
            runningButton.setImage(#imageLiteral(resourceName: "running_blue"), for: UIControlState.normal)
        }
        selectedChallenge = "Running"
        changeSegmentedControl(units: distanceUnits);
    }
    @IBAction func salad(_ sender: UIButton) {
        clearChallengesSelection()
        if (saladButton.currentImage == #imageLiteral(resourceName: "salad_blue"))  {
            saladButton.setImage(#imageLiteral(resourceName: "salad_green"), for: UIControlState.normal)
        } else {
            saladButton.setImage(#imageLiteral(resourceName: "salad_blue"), for: UIControlState.normal)
        }
        selectedChallenge = "Salad"
        changeSegmentedControl(units: foodUnits);
    }
    @IBAction func steps(_ sender: UIButton) {
        clearChallengesSelection()
        if (walkingButton.currentImage == #imageLiteral(resourceName: "walking_blue"))  {
            walkingButton.setImage(#imageLiteral(resourceName: "walking_green"), for: UIControlState.normal)
        } else {
            walkingButton.setImage(#imageLiteral(resourceName: "walking_blue"), for: UIControlState.normal)
        }
        selectedChallenge = "Walking"
        changeSegmentedControl(units: distanceUnits);
    }
    @IBAction func biking(_ sender: UIButton) {
        clearChallengesSelection()
        if (bikingButton.currentImage == #imageLiteral(resourceName: "biking_blue"))  {
            bikingButton.setImage(#imageLiteral(resourceName: "biking_green"), for: UIControlState.normal)
        } else {
            bikingButton.setImage(#imageLiteral(resourceName: "biking_blue"), for: UIControlState.normal)
        }
        selectedChallenge = "Biking"
        changeSegmentedControl(units: distanceUnits);
    }
    @IBAction func weights(_ sender: UIButton) {
        clearChallengesSelection()
        if (weightsButton.currentImage == #imageLiteral(resourceName: "weights_blue"))  {
            weightsButton.setImage(#imageLiteral(resourceName: "weights_green"), for: UIControlState.normal)
        } else {
            weightsButton.setImage(#imageLiteral(resourceName: "weights_blue"), for: UIControlState.normal)
        }
        selectedChallenge = "Weights"
        changeSegmentedControl(units: otherUnits);
    }
    @IBAction func jumprope(_ sender: UIButton) {
        clearChallengesSelection()
        if (jumpropeButton.currentImage == #imageLiteral(resourceName: "jumprope_blue"))  {
            jumpropeButton.setImage(#imageLiteral(resourceName: "jumprope_green"), for: UIControlState.normal)
        } else {
            jumpropeButton.setImage(#imageLiteral(resourceName: "jumprope_blue"), for: UIControlState.normal)
        }
        selectedChallenge = "Jumprope"
        changeSegmentedControl(units: otherUnits);
    }
    @IBAction func water(_ sender: UIButton) {
        clearChallengesSelection()
        if (waterButton.currentImage == #imageLiteral(resourceName: "water_blue"))  {
            waterButton.setImage(#imageLiteral(resourceName: "water_green"), for: UIControlState.normal)
        } else {
            waterButton.setImage(#imageLiteral(resourceName: "water_blue"), for: UIControlState.normal)
        }
        selectedChallenge = "Water"
        changeSegmentedControl(units: foodUnits);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(createChallengeViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        changeSegmentedControl(units: distanceUnits)
    }
    
    func dismissKeyboard() {
        if (amountTextField.text != nil) {
            if (Int(amountTextField.text!) != nil) {
                amount = Int(amountTextField.text!)!
            }
        }
        view.endEditing(true)
        print(amount)
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

