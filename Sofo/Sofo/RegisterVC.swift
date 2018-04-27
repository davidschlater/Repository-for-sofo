//
//  RegisterVC.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 04/12/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.layer.cornerRadius = 30
        
        registerButton.layer.shadowColor = UIColor.black.cgColor
        registerButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        registerButton.layer.shadowRadius = 4
        registerButton.layer.masksToBounds = false
        registerButton.layer.shadowOpacity = 0.2
        
        let namePlaceholder = NSAttributedString(string: "Name", attributes: [ NSForegroundColorAttributeName: UIColor.white.withAlphaComponent(0.7) ])
        nameText.attributedPlaceholder = namePlaceholder
        
        let phonePlaceholder = NSAttributedString(string: "Phone", attributes: [ NSForegroundColorAttributeName: UIColor.white.withAlphaComponent(0.7) ])
        phoneText.attributedPlaceholder = phonePlaceholder
        
        let addressPlaceholder = NSAttributedString(string: "Address", attributes: [ NSForegroundColorAttributeName: UIColor.white.withAlphaComponent(0.7) ])
        addressText.attributedPlaceholder = addressPlaceholder
        
        let emailPlaceholder = NSAttributedString(string: "Email", attributes: [ NSForegroundColorAttributeName: UIColor.white.withAlphaComponent(0.7) ])
        emailtext.attributedPlaceholder = emailPlaceholder
        
        let usernamePlaceholder = NSAttributedString(string: "Username", attributes: [ NSForegroundColorAttributeName: UIColor.white.withAlphaComponent(0.7) ])
        usernameText.attributedPlaceholder = usernamePlaceholder
        
        let passPlaceholder = NSAttributedString(string: "Password", attributes: [ NSForegroundColorAttributeName: UIColor.white.withAlphaComponent(0.7) ])
        passwordText.attributedPlaceholder = passPlaceholder

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerAction(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "LoggedIn", bundle: nil)
        let vc : DashboardVC = sb.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        self.pushToViewControllerFadeOut(controller: vc)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func loginAction(_ sender: UIButton) {
        self.popToPrevious(direction: .leftToRight)
    }
    

}
