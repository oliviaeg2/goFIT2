//
//  FriendRequestsViewController.swift
//  goFit
//
//  Created by Denis Russu on 12/8/17.
//  Copyright © 2017 CS147. All rights reserved.
//

import UIKit

class FriendRequestsViewController: UIViewController {
    
    @IBAction func acceptRequest() {
        let alert = UIAlertController(title: "Sorry!", message: "Feature not yet implemented!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
