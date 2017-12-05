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
        socialGridView.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return User.userFriendsShared.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       // let cell = UICollectionViewCell();
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "socialGridCell", for: indexPath) as! SocialCollectionViewCell
        let userName = User.userFriendsShared[indexPath.row].name
        cell.nameLabel.text = userName
        cell.friendProfPic.image = User.usersToIcons[userName]
      cell.socialCellView.layer.borderColor = UIColor.green.cgColor;
      cell.socialCellView.layer.cornerRadius = cell.frame.size.width / 3;
      cell.socialCellView.clipsToBounds = true;
      cell.socialCellView.layer.borderWidth = 3.0;
        return cell
        
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
