//
//  ProfileViewController.swift
//  goFit
//
//  Created by Olivia Gregory on 12/7/17.
//  Copyright © 2017 CS147. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var username : String?
    var profPic : UIImage?
    var challenges : [Challenge]?
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var friendProfPic: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = username!;
        friendProfPic.image = profPic!
        
        for challenge in challenges! {
            print(challenge.type)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "createSocialChallengeSegue") {
            let vc = segue.destination as! CreateSocialChallengeViewController
            vc.selectedUser = username!
        }
    }
}
