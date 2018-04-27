//
//  ChatBox.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 11/12/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import UIKit

class ChatBoxVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let messageArray = NSMutableArray()
    @IBOutlet weak var messageBack: UIView!
    @IBOutlet weak var profileBK: UIView!
    
    let screenBounds = UIScreen.main.bounds

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileBK.layer.shadowColor = UIColor.black.cgColor
        profileBK.layer.shadowOffset = CGSize(width: 0, height: 0)
        profileBK.layer.shadowRadius = 3
        profileBK.layer.masksToBounds = false
        profileBK.layer.shadowOpacity = 0.5
        
        messageBack.layer.cornerRadius = 18
        messageBack.layer.borderWidth = 1
        messageBack.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
        
        let cell0 = ["message" : "Hey there" ,
                     "type" : "headingsd" ,
                     "our" : "yes"]
        messageArray.add(cell0)
        
        let cell1 = ["message" : "Hi" ,
                     "type" : "Hi" ,
                     "our" : "no"]
        messageArray.add(cell1)
        
        let cell2 = ["message" : "How are you bro?" ,
                     "type" : "headingsd" ,
                     "our" : "yes"]
        messageArray.add(cell2)
        
        let cell3 = ["message" : "Doing well. What about you? How is your family" ,
                     "type" : "headingsd" ,
                     "our" : "no"]
        messageArray.add(cell3)
        
        let cell4 = ["message" : "Good" ,
                     "type" : "headingsd" ,
                     "our" : "yes"]
        messageArray.add(cell4)
        
//        let cell5 = ["message" : "See you" ,
//                     "type" : "headingsd" ,
//                     "our" : "yes"]
//        messageArray.add(cell5)
//        
//        let cell6 = ["message" : "Bye" ,
//                     "type" : "headingsd" ,
//                     "our" : "yes"]
//        messageArray.add(cell6)
//        
//        let cell7 = ["message" : "Bye" ,
//                     "type" : "headingsd" ,
//                     "our" : "no"]
//        messageArray.add(cell7)
        
        tableView.reloadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func shareLocationAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Location sharing", message: "Select what you want", preferredStyle: .alert)
        let action = UIAlertAction(title: "Request location", style: .default) { (UIAlertAction) in
            
            
            
        }
        
        let action2 = UIAlertAction(title: "Share my location", style: .default) { (UIAlertAction) in
            
            
            
        }
        
        let action3 = UIAlertAction(title: "Cancel", style: .default) { (UIAlertAction) in
            
            
            
        }
        
        alert.addAction(action)
        alert.addAction(action2)
        alert.addAction(action3)
        self.present(alert, animated: true, completion: nil)
        
    }
    

    // MARK: - Tableview Datasource and delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cellDict : NSDictionary = messageArray.object(at: indexPath.row) as! NSDictionary
        let type : String = cellDict.object(forKey: "type") as! String
        
        let our : String = cellDict.object(forKey: "our") as! String
        
        
        let message : String = cellDict.object(forKey: "message") as! String
        
        if our == "yes" {
            
            let cell : ChatTextCell = tableView.dequeueReusableCell(withIdentifier: "ChatTextCell") as! ChatTextCell
            
            
            
            
            var myImage = UIImage(named: "Bubble")?.withRenderingMode(.alwaysTemplate)
            let myInsets : UIEdgeInsets = UIEdgeInsetsMake(50, 50, 50, 50)
            myImage = myImage?.resizableImage(withCapInsets: myInsets)
            
            cell.backImage.image = myImage
            

            
            cell.messageLab.text = message
            cell.messageLab.sizeToFit()
            cell.imageWidth.constant = cell.messageLab.frame.size.width + CGFloat(15)
            cell.bubbleHt.constant = cell.messageLab.frame.size.height + CGFloat(10)
            
            let calculatedHt = cell.messageLab.frame.size.height + CGFloat(30)
            
            let cellHt = calculatedHt > 90 ? calculatedHt:90
            
            cell.messageLab.frame = CGRect(x: cell.messageLab.frame.origin.x, y: cellHt-cell.messageLab.frame.size.height-15, width: cell.messageLab.frame.size.width, height: cell.messageLab.frame.size.height)
            
            return cell
            
        }
        else {
            
            let cell : ChatTextTheirCell = tableView.dequeueReusableCell(withIdentifier: "ChatTextTheirCell") as! ChatTextTheirCell
            var myImage = UIImage(named: "TheirBubble")?.withRenderingMode(.alwaysTemplate)
            let myInsets : UIEdgeInsets = UIEdgeInsetsMake(50, 50, 50, 50)
            myImage = myImage?.resizableImage(withCapInsets: myInsets)
            
            cell.messageLab.text = message
            cell.messageLab.sizeToFit()
            cell.imageWidth.constant = cell.messageLab.frame.size.width + CGFloat(15)
            cell.bubbleHt.constant = cell.messageLab.frame.size.height + CGFloat(10)
            
            cell.messageLab.center = CGPoint(x: screenBounds.size.width-cell.messageLab.center.x, y: cell.messageLab.center.y)
            
            cell.backImage.image = myImage
            
            let calculatedHt = cell.messageLab.frame.size.height + CGFloat(30)
            
            let cellHt = calculatedHt > 90 ? calculatedHt:90
            
            cell.messageLab.frame = CGRect(x: cell.messageLab.frame.origin.x, y: cellHt-cell.messageLab.frame.size.height-15, width: cell.messageLab.frame.size.width, height: cell.messageLab.frame.size.height)
            
            return cell
        }
        
        

        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellDict : NSDictionary = messageArray.object(at: indexPath.row) as! NSDictionary
        let type : String = cellDict.object(forKey: "type") as! String
        
        let message : String = cellDict.object(forKey: "message") as! String
        
        let messageLab = UILabel()
        messageLab.frame = CGRect(x: 20, y: 10, width: 200, height: 60)
        messageLab.font = UIFont.systemFont(ofSize: 13)
        messageLab.numberOfLines = 0
        
        messageLab.text = message
        
        messageLab.sizeToFit()
        
        let calculatedHt = messageLab.frame.size.height + CGFloat(30)
        
        return calculatedHt > 90 ? calculatedHt:90
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    @IBAction func backAction(_ sender: UIButton) {

        self.popToPrevious(direction: .leftToRight)
    }


}

class ChatTextCell: UITableViewCell {
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    @IBOutlet weak var bubbleHt: NSLayoutConstraint!
    
    @IBOutlet weak var imageBack: UIView!
    let messageLab = UILabel()
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.selectionStyle = .none
        
        imageBack.layer.shadowColor = UIColor.black.cgColor
        imageBack.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageBack.layer.shadowRadius = 3
        imageBack.layer.masksToBounds = false
        imageBack.layer.shadowOpacity = 0.5
        
        backImage.layer.shadowColor = UIColor.black.cgColor
        backImage.layer.shadowOffset = CGSize(width: 0, height: 0)
        backImage.layer.shadowRadius = 3
        backImage.layer.masksToBounds = false
        backImage.layer.shadowOpacity = 0.3
        
        
        
        messageLab.frame = CGRect(x: 100, y: 15, width: 200, height: 60)
        messageLab.font = UIFont.systemFont(ofSize: 13)
        contentView.addSubview(messageLab)
        messageLab.numberOfLines = 0
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}

class ChatTextTheirCell: UITableViewCell {
    
    @IBOutlet weak var imageBack: UIView!
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    @IBOutlet weak var bubbleHt: NSLayoutConstraint!
    let messageLab = UILabel()
    
    var messageCenter = CGPoint()
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.selectionStyle = .none
        
        imageBack.layer.shadowColor = UIColor.black.cgColor
        imageBack.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageBack.layer.shadowRadius = 3
        imageBack.layer.masksToBounds = false
        imageBack.layer.shadowOpacity = 0.5
        
        backImage.layer.shadowColor = UIColor.black.cgColor
        backImage.layer.shadowOffset = CGSize(width: 0, height: 0)
        backImage.layer.shadowRadius = 3
        backImage.layer.masksToBounds = false
        backImage.layer.shadowOpacity = 0.3
        
        messageLab.frame = CGRect(x: 100, y: 15, width: 200, height: 60)
        messageLab.font = UIFont.systemFont(ofSize: 13)
        contentView.addSubview(messageLab)
        messageLab.numberOfLines = 0
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}

