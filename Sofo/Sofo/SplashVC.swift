//
//  SplashVC.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 09/01/18.
//  Copyright © 2018 Twixt. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.gotoLoginScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gotoLoginScreen() {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc : LoginVC = sb.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
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
