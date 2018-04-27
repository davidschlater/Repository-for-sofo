//
//  ProfileVC.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 15/12/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var contentArray = NSArray()
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    var fromOthers = Bool()
    
    let screnBounds = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        connectButton.layer.shadowColor = UIColor.black.cgColor
        connectButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        connectButton.layer.shadowRadius = 2
        connectButton.layer.masksToBounds = false
        connectButton.layer.shadowOpacity = 0.65
        connectButton.layer.cornerRadius = 20
        
        headerView.isHidden = true
        
        if fromOthers {
            connectAction(connectButton)
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func connectAction(_ sender: UIButton) {
        
        connectButton.isHidden = true
        
        loadContents()
        
       // tableView.isHidden = false
    }
    func loadContents() {
//        contentArray = [["haveText" : "0", "haveImage" : "1", "haveSubImages" : "0"],
//                        ["haveText" : "1", "haveImage" : "1", "haveSubImages" : "0"],
//                        ["haveText" : "0", "haveImage" : "1", "haveSubImages" : "0"],
//                        ["haveText" : "0", "haveImage" : "1", "haveSubImages" : "1"],
//                        ["haveText" : "1", "haveImage" : "1", "haveSubImages" : "1"],
//                        ["haveText" : "1", "haveImage" : "1", "haveSubImages" : "1"]]
        
        contentArray = [["haveText" : "0", "haveImage" : "1", "haveSubImages" : "0"],
                        ["haveText" : "1", "haveImage" : "1", "haveSubImages" : "0"],
                        ["haveText" : "1", "haveImage" : "1", "haveSubImages" : "1"],]
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackAction(_ sender: UIButton) {
        self.popToPrevious(direction: .leftToRight)
    }
    @IBAction func editButtonAction(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Chat", bundle: nil)
        let vc : PostVC = sb.instantiateViewController(withIdentifier: "PostVC") as! PostVC
        self.pushToViewController(controller: vc, direction: .rightToLeft)
        
    }

    // MARK: - Tableview Datasource and delegates
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 260
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cardView = UIView()
        cardView.frame = CGRect(x: 0, y: 0, width: screnBounds.size.width, height: 380)
        cardView.backgroundColor = UIColor.white
        
        cardView.layer.masksToBounds = true
        
        
        let sb = UIStoryboard(name: "LoggedIn", bundle: nil)
        let vc : ProfileHeaderVC = sb.instantiateViewController(withIdentifier: "ProfileHeaderVC") as! ProfileHeaderVC
        self.addChildViewController(vc)
        cardView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
        vc.view.frame = cardView.bounds
        
        return cardView
    }
    
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        
        headerView.isHidden = false
        print("Dissappeared...")
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        headerView.isHidden = true
        print("Appeared...")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            
            let cell : ProfileHeaderCell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeaderCell", for: indexPath) as! ProfileHeaderCell
            
            return cell
        }
        else {
            
            let cell : ProfileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            
            
            let dict : NSDictionary = contentArray.object(at: indexPath.row-1) as! NSDictionary
            
            if let haveText : String = dict.object(forKey: "haveText") as? String {
                if haveText == "1" {
                    cell.topLayout.constant = 40
                }
                else {
                    cell.topLayout.constant = 0
                    
                    cell.textLab.isHidden = true
                }
            }
            
            if let haveImage : String = dict.object(forKey: "haveImage") as? String {
                if haveImage == "1" {
                    
                }
            }
            
            if let haveSubImages : String = dict.object(forKey: "haveSubImages") as? String {
                if haveSubImages == "1" {
                    cell.bottomLayout.constant = 75
                }
                else {
                    cell.bottomLayout.constant = 10
                    cell.subImageBack.isHidden = true
                }
            }
            
            
            return cell
            
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        if indexPath.row == 0 {
            
            return 130
        }
        else {
            
            var cellHt : CGFloat = 60
            
            let dict : NSDictionary = contentArray.object(at: indexPath.row-1) as! NSDictionary
            
            if let haveText : String = dict.object(forKey: "haveText") as? String {
                if haveText == "1" {
                    cellHt = cellHt + 50
                }
            }
            
            if let haveImage : String = dict.object(forKey: "haveImage") as? String {
                if haveImage == "1" {
                    cellHt = cellHt + 160
                }
            }
            
            if let haveSubImages : String = dict.object(forKey: "haveSubImages") as? String {
                if haveSubImages == "1" {
                    cellHt = cellHt + 80
                }
            }
            
            return cellHt
            
        }
        
        
        
    }

}


class ProfileCell: UITableViewCell {
    
    @IBOutlet weak var topLayout: NSLayoutConstraint!
    @IBOutlet weak var bottomLayout: NSLayoutConstraint!
    
    @IBOutlet weak var textLab: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var subImageBack: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
 }

    
}


class ProfileHeaderCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
}

