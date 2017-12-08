//
//  ProfileTableViewCell.swift
//  goFit
//
//  Created by Olivia Gregory on 12/8/17.
//  Copyright © 2017 CS147. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var challengeName: UILabel!
    @IBOutlet weak var challengeQuantity: UILabel!
    @IBOutlet weak var challengeIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
