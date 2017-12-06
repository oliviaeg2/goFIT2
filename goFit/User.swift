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
    
    static var usersToIcons = ["Denis": #imageLiteral(resourceName: "denis"), "Bryce": #imageLiteral(resourceName: "bryce"), "Christina": #imageLiteral(resourceName: "christina"), "Olivia": #imageLiteral(resourceName: "olivia"), "Me": #imageLiteral(resourceName: "dylan"), "ME": #imageLiteral(resourceName: "dylan")]
    
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
}
