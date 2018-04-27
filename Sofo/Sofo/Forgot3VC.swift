//
//  Forgot3VC.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 04/12/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import UIKit

class Forgot3VC: UIViewController {
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var password1Field: UITextField!
    @IBOutlet weak var password2Field: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButton.layer.cornerRadius = 30
        
        resetButton.layer.shadowColor = UIColor.black.cgColor
        resetButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        resetButton.layer.shadowRadius = 4
        resetButton.layer.masksToBounds = false
        resetButton.layer.shadowOpacity = 0.2
        
        let pass1Placeholder = NSAttributedString(string: "Code received", attributes: [ NSForegroundColorAttributeName: UIColor.white.withAlphaComponent(0.7) ])
        password1Field.attributedPlaceholder = pass1Placeholder
        
        let pass2Placeholder = NSAttributedString(string: "Code received", attributes: [ NSForegroundColorAttributeName: UIColor.white.withAlphaComponent(0.7) ])
        password2Field.attributedPlaceholder = pass2Placeholder

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func closeAction(_ sender: Any) {
        
        self.popToViewController(controller: Singleton.sharedInstance.loginVC, direction: .topToBottom)
        
    }
    
    @IBAction func resetAction(_ sender: UIButton) {
        
        self.popToViewController(controller: Singleton.sharedInstance.loginVC, direction: .topToBottom)

        
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.popToPrevious(direction: .leftToRight)
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
