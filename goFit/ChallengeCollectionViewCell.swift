//
//  ChallengeCollectionViewCell.swift
//  goFitOliviaBranch
//
//  Created by Olivia Gregory on 11/29/17.
//  Copyright © 2017 Olivia Gregory. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class ChallengeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var cellView: MBCircularProgressBarView!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var friendImage: UIImageView!
    
    @IBOutlet weak var friendProgressBar: MBCircularProgressBarView!
}
