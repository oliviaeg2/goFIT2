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
    
    var type : String
    var frequency: Int
    //TODO: Create user class
    var user : String
    var icon: UIImage?
    var progress : Int
    
    init?(type: String, frequency: Int, user: String, icon: UIImage?) {
        if (type.isEmpty || frequency < 0 ) {
            return nil;
        }
        self.type = type;
        self.frequency = frequency;
        self.user = user;
        self.progress = 0;
        if ((icon) != nil) {
            self.icon = icon;
        }
    }
    
    
}
