//
//  SocialViewController.swift
//  goFit
//
//  Created by Olivia Gregory on 12/1/17.
//  Copyright © 2017 CS147. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBAction func addFriend() {
        let alert = UIAlertController(title: "Sorry!", message: "Feature not yet implemented!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

    @IBOutlet weak var socialGridView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        socialGridView.dataSource = self
        socialGridView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return User.userFriendsShared.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.row == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addFriendCell", for: indexPath) as! AddFriendCollectionViewCell
            return cell

        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "socialGridCell", for: indexPath) as! SocialCollectionViewCell
            let userName = User.userFriendsShared[indexPath.row - 1].name
            cell.nameLabel.text = userName
            cell.friendProfPic.image = User.usersToButtons[userName]
            return cell
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "viewProfileSegue") {
            let vc = segue.destination as! ProfileViewController
            var indexPath = socialGridView.indexPath(for: sender as! UICollectionViewCell)!
            vc.username = User.userFriendsShared[indexPath.row - 1].name
            vc.profPic = User.usersToIcons[User.userFriendsShared[indexPath.row - 1].name]
            let userChallenges = User.userFriendsShared[indexPath.row - 1].challenges
            vc.challenges = userChallenges
        }
    }

 }
