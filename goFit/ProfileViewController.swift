//
//  ProfileViewController.swift
//  goFit
//
//  Created by Olivia Gregory on 12/7/17.
//  Copyright © 2017 CS147. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var username : String?
    var profPic : UIImage?
    var challenges : [Challenge]?
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var friendProfPic: UIImageView!
    
    @IBOutlet weak var challengesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        challengesTableView.delegate = self
        challengesTableView.dataSource = self
        
        usernameLabel.text = username!;
        friendProfPic.image = profPic!
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = challengesTableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
        let curChallenge = challenges?[indexPath.row]
        cell.challengeName.text = curChallenge?.type
        cell.challengeIcon.image = Challenge.challengesToIcons[(curChallenge?.type)!]
        cell.challengeQuantity.text = String(describing: (curChallenge?.amount)!)
        return cell;
    }
    
    func tableView(_: UITableView, numberOfRowsInSection: Int) -> Int {
        return (challenges?.count)!;
        
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
