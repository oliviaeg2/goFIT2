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
    
   //static var curUserFriends =
    
    var name : String
    var challenges : [Challenge]
    
    init?(name: String?) {
        if (name == nil) {
            return nil;
        }
        self.name = name!;
        challenges = [Challenge]()
        
    }
}
