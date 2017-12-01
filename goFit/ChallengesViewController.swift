//
//  ChallengesViewController.swift
//  GoFit
//
//  Created by Olivia Gregory on 11/29/2017.
//  Copyright © 2017 Olivia Gregory. All rights reserved.
//

import UIKit

class ChallengesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var addNewButton: UIButton!
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
        return Challenge.userChallengesShared.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChallengeGridCell", for: indexPath) as! ChallengeCollectionViewCell
        let challengeTitle = Challenge.userChallengesShared[indexPath.row].type
        let challengeImage = Challenge.userChallengesShared[indexPath.row].icon
        let progress = Challenge.userChallengesShared[indexPath.row].progress
        let goal = Challenge.userChallengesShared[indexPath.row].frequency
        cell.typeLabel.text = challengeTitle
        cell.imageView.image = challengeImage
        cell.progressLabel.text = String(progress) + " " + "of"  + " " + String(goal) + " " + "complete"
        
        cell.cellView.layer.borderColor = UIColor.green.cgColor;
        cell.cellView.layer.cornerRadius = cell.frame.size.width / 3;
        cell.cellView.clipsToBounds = true;
        cell.cellView.layer.borderWidth = 3.0;
        
        return cell
        
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