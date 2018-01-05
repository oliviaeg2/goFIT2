//
//  CreateChallengeViewController.swift
//  goFit
//
//  Created by Denis Russu on 11/29/17.
//  Copyright © 2017 CS147. All rights reserved.
//

import UIKit
import SAConfettiView

class CreateChallengeViewController: UIViewController {
    
    var selectedChallenge = "NA"
    var currentFrequency  = 1;
    var selectedUser = "ME";
    var amount = 0;

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
    let confettiView = SAConfettiView()
    
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
    
    @IBOutlet weak var unitsControl: UISegmentedControl!
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBAction func createChallenge(_ sender: UIButton) {
        let unit = unitsControl.titleForSegment(at: unitsControl.selectedSegmentIndex)
        let newChallenge = Challenge.init(type: selectedChallenge, frequency: currentFrequency, amount: amount, user: selectedUser, icon: Challenge.challengesToIcons[selectedChallenge], unit: unit!);
        Challenge.userChallengesShared.insert(newChallenge!, at: 0);
        
        //TODO: Implement congrats screen
        for user in User.userFriendsShared {
            if (user.name == selectedUser) {
                user.addChallenge(newChallenge: newChallenge!)
            }
        }
        view.addSubview(confettiView)
        
        confettiView.startConfetti()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            let alert = UIAlertController(title: "Congratulations!", message: "Your challenge has been created!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Go Forth", style: .default, handler: {(alert: UIAlertAction!) in _ = self.navigationController?.popViewController(animated: true)
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
        swimmingButton.setImage(#imageLiteral(resourceName: "swimming_green"), for: UIControlState.normal)
        selectedChallenge = "Swimming"
        changeSegmentedControl(units: distanceUnits);
    }
    
    @IBAction func running(_ sender: UIButton) {
        clearChallengesSelection()
        runningButton.setImage(#imageLiteral(resourceName: "running_green"), for: UIControlState.normal)
        selectedChallenge = "Running"
        changeSegmentedControl(units: distanceUnits);
    }
    @IBAction func salad(_ sender: UIButton) {
        clearChallengesSelection()
        saladButton.setImage(#imageLiteral(resourceName: "salad_green"), for: UIControlState.normal)
        selectedChallenge = "Salad"
        changeSegmentedControl(units: foodUnits);
    }
    @IBAction func steps(_ sender: UIButton) {
        clearChallengesSelection()
        walkingButton.setImage(#imageLiteral(resourceName: "walking_green"), for: UIControlState.normal)
        selectedChallenge = "Walking"
        changeSegmentedControl(units: distanceUnits);
    }
    @IBAction func biking(_ sender: UIButton) {
        clearChallengesSelection()
        bikingButton.setImage(#imageLiteral(resourceName: "biking_green"), for: UIControlState.normal)
        selectedChallenge = "Biking"
        changeSegmentedControl(units: distanceUnits);
    }
    @IBAction func weights(_ sender: UIButton) {
        clearChallengesSelection()
        weightsButton.setImage(#imageLiteral(resourceName: "weights_green"), for: UIControlState.normal)
        selectedChallenge = "Weights"
        changeSegmentedControl(units: otherUnits);
    }
    @IBAction func jumprope(_ sender: UIButton) {
        clearChallengesSelection()
        jumpropeButton.setImage(#imageLiteral(resourceName: "jumprope_green"), for: UIControlState.normal)
        selectedChallenge = "Jumprope"
        changeSegmentedControl(units: otherUnits);
    }
    @IBAction func water(_ sender: UIButton) {
        clearChallengesSelection()
        waterButton.setImage(#imageLiteral(resourceName: "water_green"), for: UIControlState.normal)
        selectedChallenge = "Water"
        changeSegmentedControl(units: foodUnits);
    }
    
    //TODO: Add multiple friends to challenge
    @IBAction func me(_ sender: UIButton) {
        if (meButton.currentImage == #imageLiteral(resourceName: "olivia_blue"))  {
            meButton.setImage(#imageLiteral(resourceName: "olivia_green"), for: UIControlState.normal)
        } else {
            meButton.setImage(#imageLiteral(resourceName: "olivia_blue"), for: UIControlState.normal)
        }
    }
    
    @IBAction func bryce(_ sender: UIButton) {
        if (bryceButton.currentImage == #imageLiteral(resourceName: "bryce_blue"))  {
            bryceButton.setImage(#imageLiteral(resourceName: "bryce_green"), for: UIControlState.normal)
            selectedUser = "Bryce";
        } else {
            bryceButton.setImage(#imageLiteral(resourceName: "bryce_blue"), for: UIControlState.normal)
        }
    }
    @IBAction func christina(_ sender: UIButton) {
        if (christinaButton.currentImage == #imageLiteral(resourceName: "christina_blue"))  {
            christinaButton.setImage(#imageLiteral(resourceName: "christina_green"), for: UIControlState.normal)
            selectedUser = "Christina";
        } else {
            christinaButton.setImage(#imageLiteral(resourceName: "christina_blue"), for: UIControlState.normal)
        }
    }
    @IBAction func denis(_ sender: UIButton) {
        if (denisButton.currentImage == #imageLiteral(resourceName: "denis_blue"))  {
            denisButton.setImage(#imageLiteral(resourceName: "denis_green"), for: UIControlState.normal)
             selectedUser = "Denis";
        } else {
            denisButton.setImage(#imageLiteral(resourceName: "denis_blue"), for: UIControlState.normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateChallengeViewController.dismissKeyboard))
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
    }
    
}
