//
//  MenuVC.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 05/12/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import UIKit

class MenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let screenBounds = UIScreen.main.bounds
    
    @IBOutlet weak var menuView: UIView!
    
    let itemTexts = ["Profile", "Messages", "Contacts", "Settings", "Upgrade"]
    let itemImages = ["Menu_Profile.png", "Menu_Message.png", "Menu_Contacts.png", "Menu_Settings.png", "Menu_Settings.png"]
    
    var delegate : MenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.layer.shadowColor = UIColor.black.cgColor
        menuView.layer.shadowOffset = CGSize(width: 0, height: 0)
        menuView.layer.shadowRadius = 2
        menuView.layer.masksToBounds = false
        menuView.layer.shadowOpacity = 0.4
        
        menuView.isHidden = true
        print(screenBounds)

        
        
       // self.removeViewFromWindow(anim: false)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.addViewToWindow(anim: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        
        removeViewFromWindow(anim: true)
        

    }
    
    func removeViewFromWindow(anim:Bool) {
        
        let y = screenBounds.size.height/2
        
        if anim {
            
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.view.center = CGPoint(x: 80 - self.screenBounds.size.width, y: y)
            }, completion: { (Bool) in
                
                self.dismiss(animated: false) {
                
                }
                
            })
            
            
            
        }
        else {

        }
        
        
        
    }
    
    func addViewToWindow(anim:Bool) {
        
        let x = screenBounds.size.width/2
        let y = screenBounds.size.height/2
        
        if anim {
            
            
            self.view.center = CGPoint(x: 80 - screenBounds.size.width, y: y)
            menuView.isHidden = false
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.view.center = CGPoint(x: x, y: y)

            })
            
            
            
        }
        else {

        }
        
    }
    
    @IBAction func logoutAction(_ sender: UIButton) {
        self.dismiss(animated: false) { 
            
        }
        self.delegate?.logoutClicked!()
    }
    
    // MARK: - Tableview Datasource and delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemTexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : menuCell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! menuCell
        cell.itemLabel.text = itemTexts[indexPath.row]
        cell.itemImage.image = UIImage(named: itemImages[indexPath.row])?.withRenderingMode(.alwaysTemplate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: false) {
            
        }
        self.delegate?.menuItemClicked!(index: indexPath.row)
    }


    
}


class menuCell: UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


@objc protocol MenuDelegate : class {
    
    @objc optional func menuItemClicked(index:Int)
    
    @objc optional func logoutClicked()
    
}
