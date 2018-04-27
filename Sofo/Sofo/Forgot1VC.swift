//
//  Forgot1VC.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 04/12/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import UIKit

class Forgot1VC: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        continueButton.layer.cornerRadius = 30
        
        continueButton.layer.shadowColor = UIColor.black.cgColor
        continueButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        continueButton.layer.shadowRadius = 4
        continueButton.layer.masksToBounds = false
        continueButton.layer.shadowOpacity = 0.2
        
        let usernamePlaceholder = NSAttributedString(string: "Username / Email", attributes: [ NSForegroundColorAttributeName: UIColor.white.withAlphaComponent(0.7) ])
        usernameField.attributedPlaceholder = usernamePlaceholder
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeAction(_ sender: Any) {
        
        self.popToViewController(controller: Singleton.sharedInstance.loginVC, direction: .topToBottom)
        
    }

    @IBAction func continueAction(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc : Forgot2VC = sb.instantiateViewController(withIdentifier: "Forgot2VC") as! Forgot2VC
        self.pushToViewController(controller: vc, direction: .rightToLeft)
        
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
