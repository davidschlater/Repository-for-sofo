//
//  Forgot2VC.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 04/12/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import UIKit

class Forgot2VC: UIViewController {
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var codeField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        continueButton.layer.cornerRadius = 30
        
        continueButton.layer.shadowColor = UIColor.black.cgColor
        continueButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        continueButton.layer.shadowRadius = 4
        continueButton.layer.masksToBounds = false
        continueButton.layer.shadowOpacity = 0.2
        
        let codePlaceholder = NSAttributedString(string: "Code received", attributes: [ NSForegroundColorAttributeName: UIColor.white.withAlphaComponent(0.7) ])
        codeField.attributedPlaceholder = codePlaceholder

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
        let vc : Forgot3VC = sb.instantiateViewController(withIdentifier: "Forgot3VC") as! Forgot3VC
        self.pushToViewController(controller: vc, direction: .rightToLeft)
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
