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
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var friendProfPic: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = username!;
        friendProfPic.image = profPic!
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
