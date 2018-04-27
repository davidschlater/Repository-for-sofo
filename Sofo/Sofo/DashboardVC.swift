//
//  DashboardVC.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 04/12/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var mainTable: UITableView!
    
    @IBOutlet weak var aroundBtn: UIButton!
    @IBOutlet weak var clubsBtn: UIButton!
    @IBOutlet weak var nightLifeBtn: UIButton!
    @IBOutlet weak var FoodBtn: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    
    let screnBounds = UIScreen.main.bounds
    
    var buttonArray = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backImage = UIImage(named: "menuButton.png")?.withRenderingMode(.alwaysTemplate)
        menuButton.setImage(backImage, for: .normal)

        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        
        buttonArray = [aroundBtn, clubsBtn, nightLifeBtn, FoodBtn]
        
        
        
        for button in buttonArray {
            
            button.layer.borderColor = UIColor.primaryColor().cgColor
            button.layer.borderWidth = 1
        }
        
        
        self.buttonAction(aroundBtn)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuAction(_ sender: UIButton) {
        
        openLeftMenu()
        
    }

    
    @IBAction func settingsAction(_ sender: UIButton) {
        let sb = UIStoryboard(name: "LoggedIn", bundle: nil)
        let vc : SettingsVC = sb.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
        vc.popDirection = PopDirection(direction: .topToBottom)
        self.pushToViewController(controller: vc, direction: .bottomToTop)
    }
    @IBAction func mapAction(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "LoggedIn", bundle: nil)
        let vc : NearByMapVC = sb.instantiateViewController(withIdentifier: "NearByMapVC") as! NearByMapVC
        self.pushToViewController(controller: vc, direction: .topToBottom)
        
        
    }
    // MARK: - Collectionview Datasource and delegates
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionView {
            return 5
        }
        else {
            return 10
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionView {
            
            let cell : CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell",
                                                                           for: indexPath) as! CollectionCell
            
            return cell
            
        }
        else {
            let cell : MembersCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MembersCollectionCell",
                                                                           for: indexPath) as! MembersCollectionCell
            
            return cell
        }
        
        
    }
    
    // MARK: - Tableview Datasource and delegates
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if selectedIndex.contains(indexPath.row) {
            let cell : MembersTableCell = tableView.dequeueReusableCell(withIdentifier: "MembersTableCell", for: indexPath) as! MembersTableCell
            return cell
        }
        else {
            let cell : dashBoardTableCell = tableView.dequeueReusableCell(withIdentifier: "dashBoardTableCell", for: indexPath) as! dashBoardTableCell
            cell.scroll.contentSize = CGSize(width: (screnBounds.size.width-20)*2, height: 100)
            cell.currentVc = self
            
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
        
        return 100
    }
    
    var selectedIndex = [Int]()
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(indexPath.row)
//        print(selectedIndex)
//        
//        if selectedIndex.contains(indexPath.row) {
//            
//            var k = 0
//            for i in selectedIndex {
//                if i==indexPath.row {
//                    selectedIndex.remove(at: k)
//                }
//                k = k+1
//            }
//            
//            
//        }
//        else {
//            selectedIndex.append(indexPath.row)
//        }
//        
//        
//        mainTable.reloadData()
    }
    
    // MARK: - Actions
    
    @IBAction func chatAction(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Chat", bundle: nil)
        let vc : ContactListVC = sb.instantiateViewController(withIdentifier: "ContactListVC") as! ContactListVC
        vc.popDirection = PopDirection(direction: .topToBottom)
        self.pushToViewController(controller: vc, direction: .bottomToTop)
        
    }
    @IBAction func buttonAction(_ sender: UIButton) {
        
        for button in buttonArray {
            
            button.backgroundColor = UIColor.clear
            button.setTitleColor(UIColor.primaryColor(), for: .normal)
        }
        
        sender.backgroundColor = UIColor.primaryColor()
        sender.setTitleColor(UIColor.white, for: .normal)
        
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        
        
        
    }
    
    
    // MARK: - Other Methods

    // MARK: - Tableview Datasource and delegates
    
    
    
    
    @IBAction func searchAction(_ sender: UIButton) {
        self.displaySearch()
    }
    

}




class CollectionCell: UICollectionViewCell {
    override func awakeFromNib() {
        //
    }
}

class MembersCollectionCell: UICollectionViewCell {
    override func awakeFromNib() {
        //
    }
}

class dashBoardTableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var barPic: UIImageView!
    @IBOutlet weak var nameLab: UILabel!
    @IBOutlet weak var descLab: UILabel!
    
    let screnBounds = UIScreen.main.bounds
    
    var currentVc = UIViewController()
    
    @IBOutlet weak var membersCollection: UICollectionView!
    override func awakeFromNib() {
        
        membersCollection.delegate = self
        membersCollection.dataSource = self
        
        self.selectionStyle = .none
        
//        barPic.layer.cornerRadius = 45
//        barPic.layer.masksToBounds = true
        //
    }
    @IBAction func showMembers(_ sender: UIButton) {
        
        scroll.setContentOffset(CGPoint(x:screnBounds.size.width-20, y:0), animated: true)
        
    }
    
    @IBAction func removeMembers(_ sender: UIButton) {
        
        scroll.setContentOffset(CGPoint(x:0, y:0), animated: true)
        
    }
    
    @IBAction func tableButtonAction(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "LoggedIn", bundle: nil)
        let vc : SpecificLocationVC = sb.instantiateViewController(withIdentifier: "SpecificLocationVC") as! SpecificLocationVC
        currentVc.pushToViewController(controller: vc, direction: .rightToLeft)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell : MembersCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MembersCollectionCell",
                                                                              for: indexPath) as! MembersCollectionCell
        
        return cell
        
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    
    
}



class MembersTableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var membersCollection: UICollectionView!
    override func awakeFromNib() {
        
        membersCollection.delegate = self
        membersCollection.dataSource = self
        //
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
            let cell : MembersCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MembersCollectionCell",
                                                                           for: indexPath) as! MembersCollectionCell
            
            return cell
            
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return 10
        
    }

    
}


