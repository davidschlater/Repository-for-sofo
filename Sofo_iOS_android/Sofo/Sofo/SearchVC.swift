//
//  SearchVC.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 10/01/18.
//  Copyright © 2018 Twixt. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    var vcSuperView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeSearch(_ sender: UIButton) {
        
        let screnBounds = UIScreen.main.bounds
        
        UIView.animate(withDuration: 0.5, animations: {
            self.vcSuperView.frame = CGRect(x: screnBounds.size.width, y: 18, width: screnBounds.size.width, height: 50)
        }) { (bool) in
            self.vcSuperView.removeFromSuperview()
        }
        
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
