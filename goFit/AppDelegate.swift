//
//  AppDelegate.swift
//  goFit
//
//  Created by Denis Russu on 11/13/17.
//  Copyright © 2017 CS147. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let initialChallengeTitles = ["Walking", "Weights", "Biking", "Swimming", "Salad", "Water"];
        let initialChallengeImages = [#imageLiteral(resourceName: "steps"), #imageLiteral(resourceName: "weights"), #imageLiteral(resourceName: "bike"), #imageLiteral(resourceName: "swimming"), #imageLiteral(resourceName: "salad"), #imageLiteral(resourceName: "water")];
        
        let initialFriendNames = ["ME", "Denis", "Bryce","Christina"];
        let initialFriendImages = [#imageLiteral(resourceName: "olivia"), #imageLiteral(resourceName: "denis"), #imageLiteral(resourceName: "bryce"), #imageLiteral(resourceName: "christina")];

        
        //initialize challenges
        var i = 0;
        var curChallenge : Challenge
        
        for challengeType in initialChallengeTitles {
            if (i < 4) {
            curChallenge = Challenge(type: challengeType, frequency: 4, user: initialFriendNames[i], icon: initialChallengeImages[i])!;
            }
            else {
                curChallenge = Challenge(type: challengeType, frequency: 4, user: initialFriendNames[i - 3], icon: initialChallengeImages[i])!;
            }
            Challenge.userChallengesShared.append(curChallenge);
            i = i + 1;
        }
        
        
        var curUser : User
        var j = 0;
        
        for userName in initialFriendNames {
            curUser = User(name: userName, image: initialFriendImages[j])!;
            let dummyChallenge = Challenge.userChallengesShared[j];
            if (j < 4) {
                let dummyChallenge = Challenge.userChallengesShared[j];
                curUser.addChallenge(newChallenge: dummyChallenge);
            }
            else {
                let dummyChallenge = Challenge.userChallengesShared[j - 3];
                curUser.addChallenge(newChallenge: dummyChallenge);
            }
            User.userFriendsShared.append(curUser);
            j += 1;
        }

        let universalFriendNames = ["Denis", "Bryce", "Olivia", "Christina", "Dylan", "Marc", "Niall", "Sophia", "Dog", "God", "Beyonce"]
        let universalFriendImages = [#imageLiteral(resourceName: "denis"), #imageLiteral(resourceName: "bryce"), #imageLiteral(resourceName: "olivia"), #imageLiteral(resourceName: "christina"), #imageLiteral(resourceName: "dylan"), #imageLiteral(resourceName: "marc"), #imageLiteral(resourceName: "niall"), #imageLiteral(resourceName: "sophia"), #imageLiteral(resourceName: "dog"), #imageLiteral(resourceName: "god"), #imageLiteral(resourceName: "beyonce")]
        
        var k = 0;
        
        for name in universalFriendNames {
            curUser = User(name: name, image: universalFriendImages[k])!;
            User.universalFriendsShared.append(curUser);
            k += 1;
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

