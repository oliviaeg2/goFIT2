//
//  User.swift
//  goFit
//
//  Created by Olivia Gregory on 12/1/17.
//  Copyright © 2017 CS147. All rights reserved.
//

import UIKit

class User: NSObject {
     static var userFriendsShared = [User]()
     static var universalFriendsShared = [User]()
    
    var name : String
    var challenges : [Challenge]
    var proPic : UIImage
    
    static var usersToIcons = ["Denis": #imageLiteral(resourceName: "denis"), "Bryce": #imageLiteral(resourceName: "bryce"), "Christina": #imageLiteral(resourceName: "christina"), "Dylan": #imageLiteral(resourceName: "dylan"), "Me": #imageLiteral(resourceName: "olivia"), "ME": #imageLiteral(resourceName: "olivia")]
    
    static var usersToButtons = ["Denis": #imageLiteral(resourceName: "denis_blue"), "Bryce": #imageLiteral(resourceName: "bryce_blue"), "Christina": #imageLiteral(resourceName: "christina_blue"), "Dylan": #imageLiteral(resourceName: "dylan_blue"), "Me": #imageLiteral(resourceName: "olivia_blue"), "ME": #imageLiteral(resourceName: "olivia_blue")]
    
    init?(name: String?, image: UIImage?) {
        if (name == nil) {
            return nil;
        }
        self.name = name!;
        if ((image) != nil) {
        self.proPic = image!;
        } else {
            self.proPic = #imageLiteral(resourceName: "user");
        }
        challenges = [Challenge]()
        
    }
    
    func addChallenge(newChallenge: Challenge) {
        self.challenges.append(newChallenge);
    }
}
