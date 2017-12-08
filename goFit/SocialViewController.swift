//
//  SocialViewController.swift
//  goFit
//
//  Created by Olivia Gregory on 12/1/17.
//  Copyright © 2017 CS147. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {


    @IBOutlet weak var socialGridView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        socialGridView.dataSource = self
        socialGridView.delegate = self
        //socialGridView.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return User.userFriendsShared.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "socialGridCell", for: indexPath) as! SocialCollectionViewCell
        let userName = User.userFriendsShared[indexPath.row].name
        cell.nameLabel.text = userName
        cell.friendProfPic.image = User.usersToButtons[userName]
        return cell
        
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "viewProfileSegue") {
            let vc = segue.destination as! ProfileViewController
            var indexPath = socialGridView.indexPath(for: sender as! UICollectionViewCell)!
            vc.username = User.userFriendsShared[indexPath.row].name
            vc.profPic = User.usersToIcons[User.userFriendsShared[indexPath.row].name]
            let userChallenges = User.userFriendsShared[indexPath.row].challenges
            vc.challenges = userChallenges
        }
    }

 }
