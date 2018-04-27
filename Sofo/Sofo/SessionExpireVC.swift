//
//  SessionExpireVC.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 04/12/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import UIKit

class SessionExpireVC: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 30
        
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        loginButton.layer.shadowRadius = 4
        loginButton.layer.masksToBounds = false
        loginButton.layer.shadowOpacity = 0.2

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        self.navigationController?.popToRootViewController(animated: true)
    
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
