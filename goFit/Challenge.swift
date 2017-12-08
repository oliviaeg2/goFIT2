//
//  Challege.swift
//  goFitOliviaBranch
//
//  Created by Olivia Gregory on 11/30/17.
//  Copyright © 2017 Olivia Gregory. All rights reserved.
//

import UIKit

class Challenge: NSObject {
    static var userChallengesShared = [Challenge]()
    
    static var challengesToIcons = ["Walking" : #imageLiteral(resourceName: "steps"), "Swimming": #imageLiteral(resourceName: "swimming"), "Salad": #imageLiteral(resourceName: "salad"), "Running": #imageLiteral(resourceName: "running"), "Biking": #imageLiteral(resourceName: "bike"), "Weights": #imageLiteral(resourceName: "weights"), "Jumprope": #imageLiteral(resourceName: "jumprope"), "Water": #imageLiteral(resourceName: "water")];
    
    var type : String
    var frequency: Int
    var user : String
    var icon: UIImage?
    var progress : Int
    //var goalDescription : String
    var amount : Int
    //var unit: String
    
    init?(type: String, frequency: Int, amount: Int, user: String, icon: UIImage?, unit: String) {
        if (type.isEmpty || frequency < 0 ) {
            return nil;
        }
        self.amount = amount
        self.type = type;
        self.frequency = frequency;
        self.user = user;
        self.progress = 0;
        if ((icon) != nil) {
            self.icon = icon;
        }
    }
    
    class func moveCompletedToEnd(intToMove: Int) {
        let tempChallenge = userChallengesShared[intToMove]
        userChallengesShared.remove(at: intToMove)
        userChallengesShared.append(tempChallenge)
    }
    
    
}
