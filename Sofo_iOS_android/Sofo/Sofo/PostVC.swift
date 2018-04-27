//
//  PostVC.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 15/12/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import UIKit

class PostVC: UIViewController {
    
    @IBOutlet weak var messageBack: UIView!
    @IBOutlet weak var bkView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageBack.layer.cornerRadius = 18
        messageBack.layer.borderWidth = 1
        messageBack.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
        
        bkView.layer.shadowColor = UIColor.black.cgColor
        bkView.layer.shadowOffset = CGSize(width: 0, height: 0)
        bkView.layer.shadowRadius = 3
        bkView.layer.masksToBounds = false
        bkView.layer.shadowOpacity = 0.25
        bkView.layer.cornerRadius = 2.5

        // Do any additional setup after loading the view.
    }
    @IBAction func backAction(_ sender: UIButton) {
        self.popToPrevious(direction: .leftToRight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shareLocationAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Location sharing", message: "Select what you want", preferredStyle: .alert)
        
        
        let action1 = UIAlertAction(title: "Share my location", style: .default) { (UIAlertAction) in
            
            
            
        }
        
        let action2 = UIAlertAction(title: "Cancel", style: .default) { (UIAlertAction) in
            
            
            
        }
        
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true, completion: nil)
        
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
