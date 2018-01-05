//
//  ChallengesViewController.swift
//  GoFit
//
//  Created by Olivia Gregory on 11/29/2017.
//  Copyright © 2017 Olivia Gregory. All rights reserved.
//

import UIKit

class ChallengesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var challengesGridView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        challengesGridView.dataSource = self
        challengesGridView.delegate = self
       }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        challengesGridView.dataSource = self
        challengesGridView.delegate = self
        self.challengesGridView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Challenge.userChallengesShared.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.row > 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChallengeGridCell", for: indexPath) as! ChallengeCollectionViewCell
            let challenge = Challenge.userChallengesShared[indexPath.row - 1]
            let friend = challenge.user
            
            cell.imageView.image = challenge.icon
            cell.typeLabel.text = challenge.type
            cell.goalLabel.text = String(challenge.amount) + " " + challenge.unit
            cell.progressLabel.text = String(challenge.progress) + " of " + String(challenge.goal);
            
            cell.cellView.value = CGFloat(challenge.progress);
            cell.cellView.maxValue = CGFloat(challenge.goal);
            if (challenge.progress == challenge.goal) {
                cell.cellView.progressColor = UIColor.green
                cell.cellView.progressStrokeColor = UIColor.green
                cell.cellView.alpha = 0.5
            }
            
            cell.friendImage.image = User.usersToIcons[friend]
            cell.friendImage.layer.cornerRadius = 11;
            cell.friendImage.clipsToBounds = true;
            
            // TODO: non-random friend progress
            cell.friendProgressBar.value = CGFloat(arc4random_uniform(6));
            cell.friendProgressBar.maxValue = 5;
            if (cell.friendProgressBar.value == 5) {
                cell.friendProgressBar.progressStrokeColor = UIColor.green
            }
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddGridCell", for: indexPath) as! AddChallengeCollectionViewCell
            return cell
        }
    }
}
