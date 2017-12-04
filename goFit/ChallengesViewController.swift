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
        challengesGridView.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
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
        let challengeTitle = Challenge.userChallengesShared[indexPath.row - 1].type
        let challengeImage = Challenge.userChallengesShared[indexPath.row - 1].icon
        let progress = Challenge.userChallengesShared[indexPath.row - 1].progress
        let goal = Challenge.userChallengesShared[indexPath.row - 1].frequency
        let curUser = Challenge.userChallengesShared[indexPath.row - 1].user
        cell.typeLabel.text = challengeTitle
        cell.imageView.image = challengeImage
        cell.friendLabel.text = curUser
        cell.progressLabel.text = String(progress) + " " + "of"  + " " + String(goal) + " " + "complete"
        
        cell.cellView.layer.borderColor = UIColor.green.cgColor;
        cell.cellView.layer.cornerRadius = cell.frame.size.width / 3;
        cell.cellView.clipsToBounds = true;
        cell.cellView.layer.borderWidth = 3.0;
        return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddGridCell", for: indexPath) as! AddNewCollectionViewCell
            return cell;
        }
        let cell = UICollectionViewCell();
        return cell;
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Create New Segue") {
            //var indexPath: NSIndexPath
            //var vc = segue.destination as! CreateChallengeViewController
            //indexPath = challengesGridView.indexPath(for: sender as! UICollectionViewCell)! as NSIndexPath
            
            //vc.title = challengeCategories[indexPath.row] as! String
        }
    }
}
