//
//  SettingsVC.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 07/12/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var popDirection = PopDirection(direction: .leftToRight)
    
    @IBOutlet weak var tableView: UITableView!
    let menuArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setMenuArray()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setMenuArray() {
        
        let cell0 = ["title" : "Account settings" ,
                     "type" : "heading"]
        menuArray.add(cell0)
        
        //_______________________
        
        let cell1 = ["title" : "Cristiano Ronaldo" ,
                     "type" : "edit"]
        menuArray.add(cell1)
        let cell2 = ["title" : "**********" ,
                     "type" : "edit"]
        menuArray.add(cell2)
        let cell3 = ["title" : "cr7@cr7.com" ,
                     "type" : "edit"]
        menuArray.add(cell3)
        let cell4 = ["title" : "Address" ,
                     "type" : "edit"]
        menuArray.add(cell4)
        
        //_______________________
        
        let cell5 = ["title" : "Privacy" ,
                     "type" : "heading"]
        menuArray.add(cell5)
        
        //_______________________
        
        let cell6 = ["title" : "Ghost Mode" ,
                     "type" : "switch"]
        menuArray.add(cell6)
        let cell7 = ["title" : "Business mode" ,
                     "type" : "switch"]
        menuArray.add(cell7)
        
        //_______________________
        
        let cell8 = ["title" : "Add Your Social media Accounts" ,
                     "type" : "heading"]
        menuArray.add(cell8)
        
        //_______________________
        
        let cell9 = ["title" : "Facebook" ,
                     "type" : "social"]
        menuArray.add(cell9)
        let cell10 = ["title" : "Twitter" ,
                     "type" : "social"]
        menuArray.add(cell10)
        let cell11 = ["title" : "Instagram" ,
                      "type" : "social"]
        menuArray.add(cell11)
        
        //_______________________
        
        let cell15 = ["title" : "Snapchat Username" ,
                      "type" : "edit"]
        menuArray.add(cell15)
        
        //_______________________
        
        let cell12 = ["title" : "Professional" ,
                     "type" : "heading"]
        menuArray.add(cell12)
        
        //_______________________
        
        let cell13 = ["title" : "Linked In" ,
                     "type" : "switch"]
        menuArray.add(cell13)
        
        //_______________________
        
        let cell14 = ["title" : "Company Name" ,
                     "type" : "edit"]
        menuArray.add(cell14)
        
        //_______________________


        
        tableView.reloadData()
        
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        
        self.popToPrevious(direction: popDirection.direction)
        
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        
        self.popToPrevious(direction: popDirection.direction)
        
    }


    // MARK: - Tableview Datasource and delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellDict : NSDictionary = menuArray.object(at: indexPath.row) as! NSDictionary
        let type : String = cellDict.object(forKey: "type") as! String
        
        let title : String = cellDict.object(forKey: "title") as! String
        
        switch type {
        case "heading":
            let cell : SettingsHeaderCell = tableView.dequeueReusableCell(withIdentifier: "SettingsHeaderCell", for: indexPath) as! SettingsHeaderCell
            cell.titleLab.text = title
            
            return cell
        case "edit":
            let cell : SettingsEditableCell = tableView.dequeueReusableCell(withIdentifier: "SettingsEditableCell", for: indexPath) as! SettingsEditableCell
            cell.titleLab.text = title
            
            return cell
        case "switch":
            let cell : SettingsSwithesCell = tableView.dequeueReusableCell(withIdentifier: "SettingsSwithesCell", for: indexPath) as! SettingsSwithesCell
            cell.titleLab.text = title
            
            return cell
        case "social":
            let cell : SettingsSocialCell = tableView.dequeueReusableCell(withIdentifier: "SettingsSocialCell", for: indexPath) as! SettingsSocialCell
            cell.titleLab.text = title
            
            return cell
        default:
            let cell : SettingsHeaderCell = tableView.dequeueReusableCell(withIdentifier: "SettingsHeaderCell", for: indexPath) as! SettingsHeaderCell
            cell.titleLab.text = title
            
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellDict : NSDictionary = menuArray.object(at: indexPath.row) as! NSDictionary
        let type : String = cellDict.object(forKey: "type") as! String
        
        
        switch type {
        case "heading":
            
            return 60
        case "edit":
            
            
            return 60
        case "switch":
            
            return 100
        case "social":
            
            return 60
        default:
            
            return 60
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    


}



class SettingsHeaderCell: UITableViewCell {
    
    @IBOutlet weak var titleLab: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

}


class SettingsEditableCell: UITableViewCell {
    
    @IBOutlet weak var titleLab: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
}

class SettingsSocialCell: UITableViewCell {
    
    @IBOutlet weak var switchButton: UIButton!
    
    @IBOutlet weak var titleLab: UILabel!
    override func awakeFromNib() {
        
        switchButton.setImage(UIImage(named:"Off Button"), for: .normal)
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    @IBAction func switchButtonAction(_ sender: UIButton) {
        
        if sender.tag == 0 {
            
            sender.tag = 1
            sender.setImage(UIImage(named:"On Button"), for: .normal)
            
        }
        else {
            
            sender.tag = 0
            sender.setImage(UIImage(named:"Off Button"), for: .normal)
            
        }
        
    }
    
}

class SettingsSwithesCell: UITableViewCell {
    
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var descLab: UILabel!
    @IBOutlet weak var switchButton: UIButton!
    override func awakeFromNib() {
        
//        _switch.onTintColor = UIColor.clear
//        
//        _switch.onImage = UIImage(named: "sampleGradient.png")
//        _switch.offImage = #imageLiteral(resourceName: "sampleGradient.png")
        
        switchButton.setImage(UIImage(named:"Off Button"), for: .normal)
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    @IBAction func switchButtonAction(_ sender: UIButton) {
        
        if sender.tag == 0 {
            
            sender.tag = 1
            sender.setImage(UIImage(named:"On Button"), for: .normal)
            
        }
        else {
            
            sender.tag = 0
            sender.setImage(UIImage(named:"Off Button"), for: .normal)
            
        }
        
    }
}
