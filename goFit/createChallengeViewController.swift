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
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBAction func createChallenge(_ sender: UIButton) {
        //TODO: Implement users
        let newChallenge = Challenge.init(type: selectedChallenge, frequency: currentFrequency, user: selectedUser, icon: Challenge.challengesToIcons[selectedChallenge]);
        Challenge.userChallengesShared.insert(newChallenge!, at: 0);
        //TODO: CONGRATS screen
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func startedTypingAmount(_ sender: Any) {
//        if ((amountTextField.text) != nil) {
//        //check if number
//        amount = Int(amountTextField.text!)!
//        }
//        else {
//            amount = 0
//        }
    }
    
    
    
    @IBAction func unitSelected(_ sender: Any) {
        //let total = currentFrequency * amount
       //totalLabel.text = "( " + String(total) + distanceUnits[unitsControl.selectedSegmentIndex] + "per week)"
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
    
    @IBAction func me(_ sender: UIButton) {
        if (meButton.currentImage == #imageLiteral(resourceName: "profile_blue"))  {
            meButton.setImage(#imageLiteral(resourceName: "profile_green"), for: UIControlState.normal)
        } else {
            meButton.setImage(#imageLiteral(resourceName: "profile_blue"), for: UIControlState.normal)
        }
    }
    
    @IBAction func bryce(_ sender: UIButton) {
        if (bryceButton.currentImage == #imageLiteral(resourceName: "bryce_blue"))  {
            bryceButton.setImage(#imageLiteral(resourceName: "bryce_green"), for: UIControlState.normal)
            selectedUser = "Bryce";
        } else {
            bryceButton.setImage(#imageLiteral(resourceName: "bryce_blue"), for: UIControlState.normal)
//            selectedUser = "Bryce";
        }
    }
    @IBAction func christina(_ sender: UIButton) {
        if (christinaButton.currentImage == #imageLiteral(resourceName: "christina_blue"))  {
            christinaButton.setImage(#imageLiteral(resourceName: "christina_green"), for: UIControlState.normal)
            selectedUser = "Christina";
        } else {
            christinaButton.setImage(#imageLiteral(resourceName: "christina_blue"), for: UIControlState.normal)
            //selectedUser = "Christina";
        }
    }
    @IBAction func denis(_ sender: UIButton) {
        if (denisButton.currentImage == #imageLiteral(resourceName: "denis_blue"))  {
            denisButton.setImage(#imageLiteral(resourceName: "denis_green"), for: UIControlState.normal)
             selectedUser = "Denis";
        } else {
            denisButton.setImage(#imageLiteral(resourceName: "denis_blue"), for: UIControlState.normal)
           // selectedUser = "Denis";
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(createChallengeViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        changeSegmentedControl(units: distanceUnits)
        
//        meButton.layer.cornerRadius = meButton.frame.size.width / 2;
//        meButton.clipsToBounds = true;
//        meButton.layer.borderWidth = 5.0;
//        meButton.layer.borderColor = UIColor.blue.cgColor
        
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
