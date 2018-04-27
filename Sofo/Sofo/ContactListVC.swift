//
//  ContactListVC.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 12/12/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import UIKit

class ContactListVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource {

    
    var popDirection = PopDirection(direction: .leftToRight)
    
    @IBOutlet weak var AboveCollection: UICollectionView!
    
    @IBOutlet weak var BelowCollection: UICollectionView!
    
    @IBOutlet weak var lettersTable: UITableView!
    
    
    let letterString = "#abcdefghijklmnopqrstuvwxyz".uppercased()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AboveCollection.delegate = self
        AboveCollection.dataSource = self
        
        BelowCollection.delegate = self
        BelowCollection.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackAction(_ sender: UIButton) {
        
        self.popToPrevious(direction: popDirection.direction)
        
    }

    
    // MARK: - Collectionview Datasource and delegates
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return 5
    }
    
    
    var selectedIndex = 0
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == AboveCollection {
            
            if indexPath.row == 4 {
                let cell : AddContactCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddContactCollectionCell",
                                                                                           for: indexPath) as! AddContactCollectionCell
                
                return cell
            }
            else {
                let cell : ContactAboveCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactAboveCollectionCell",
                                                                                           for: indexPath) as! ContactAboveCollectionCell
                
                return cell
            }
            
            
            
        }
        else {
            
            let cell : ContactBelowCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactBelowCollectionCell",
                                                                                       for: indexPath) as! ContactBelowCollectionCell
            
            return cell
            
        }
        
        
    }
    
    // MARK: - Tableview Datasource and delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == lettersTable {
            return 27
        }
        
        return 6
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == lettersTable {
            let cell : LettersCell = tableView.dequeueReusableCell(withIdentifier: "LettersCell", for: indexPath) as! LettersCell
            cell.letterLab.text = letterString[indexPath.row]
            return cell
        }
        
        let cell : ContactCell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
        cell.vc = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == lettersTable {
            return 25
        }
        
        return 110
        
    }
    

}

class ContactAboveCollectionCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        
        
        
    }
    
}

class AddContactCollectionCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        
        
        
    }
    
}



class ContactBelowCollectionCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        
        
        
    }
    
}

class ContactCell: UITableViewCell {
    
    var vc = UIViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    @IBAction func GotoChat(_ sender: UIButton) {
        
        
        let sb = UIStoryboard(name: "Chat", bundle: nil)
        let chat : ChatBoxVC = sb.instantiateViewController(withIdentifier: "ChatBoxVC") as! ChatBoxVC
        vc.pushToViewController(controller: chat, direction: .rightToLeft)

        
    }
}


class LettersCell: UITableViewCell {
    
    @IBOutlet weak var letterLab: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
}


