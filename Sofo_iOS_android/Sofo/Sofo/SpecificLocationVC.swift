//
//  SpecificLocationVC.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 12/12/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import UIKit
import GoogleMaps

class SpecificLocationVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource, SpecificLocDelegate, OthersProfDelegate {

    let screnBounds = UIScreen.main.bounds
    
    @IBOutlet weak var mapBack: UIView!
    @IBOutlet weak var contactCollection: UICollectionView!
    var mapView = GMSMapView()
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactCollection.delegate = self
        contactCollection.dataSource = self
        
        let backImage = UIImage(named: "backButton2.png")?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(backImage, for: .normal)
        
        let camera = GMSCameraPosition.camera(withLatitude: 40.7128, longitude: -75.0059, zoom: 12.0)
        //mapView = GMSMapView.map(withFrame: CGRect(x:0,y:0,width:screenBounds.size.width,height:screenBounds.size.height-120), camera: camera)
        mapView = GMSMapView.map(withFrame: mapBack.bounds, camera: camera)
        // view = mapView
        
        //  mapView.delegate = self
        mapBack.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(40.7118), longitude: CLLocationDegrees(-75.0059))
        marker.map = mapView
        marker.icon = UIImage(named: "MapPin.png")
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        
        self.popToPrevious(direction: .leftToRight)
        
    }
    

    // MARK: - Collectionview Datasource and delegates
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : SpecificLocationCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpecificLocationCollectionCell",
                                                                       for: indexPath) as! SpecificLocationCollectionCell
        
        
        cell.delegate = self
        return cell
    }
    
    // MARK: - Tableview Datasource and delegates
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : SpecificLocationTableCell = tableView.dequeueReusableCell(withIdentifier: "SpecificLocationTableCell", for: indexPath) as! SpecificLocationTableCell
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func gotoProfileAction() {
        print("Profile")
        
//        for _ in 0...6 {
//            displayCards()
//        }
        
        displaySliderCards()
        
    }
    
    
    func displayCards() {
        
        
        let wid : CGFloat = 280
        let ht : CGFloat = 500
        
        let cardView = UIView()
        cardView.frame = CGRect(x: screnBounds.size.width/2-wid/2, y: screnBounds.size.height/2-ht/2, width: wid, height: ht)
        self.view.addSubview(cardView)
        cardView.backgroundColor = UIColor.lightGray
        
        cardView.layer.cornerRadius = 4
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cardView.layer.shadowRadius = 4
        cardView.layer.masksToBounds = false
        cardView.layer.shadowOpacity = 0.2
        
        let sb = UIStoryboard(name: "LoggedIn", bundle: nil)
        let vc : OthersProfileVC = sb.instantiateViewController(withIdentifier: "OthersProfileVC") as! OthersProfileVC
        self.addChildViewController(vc)
        cardView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
        vc.view.frame = cardView.bounds
        vc.view.layer.cornerRadius = 4
        vc.view.layer.masksToBounds = true
        
        let cardView1 = UIView()
        cardView1.frame = cardView.bounds
        cardView.addSubview(cardView1)
        // cardView1.backgroundColor = UIColor.lightGray
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(gotoSpecific))
//        tap.numberOfTapsRequired = 1
//        tap.numberOfTouchesRequired = 1
//        tap.addTarget(self, action: #selector(gotoSpecific))
//        cardView1.addGestureRecognizer(tap)
        
        
        let longGesture = UILongPressGestureRecognizer()
        longGesture.addTarget(self, action: #selector(moveViewWithGesture(gesture:)))
        longGesture.numberOfTapsRequired = 0
        longGesture.numberOfTouchesRequired = 1
        longGesture.minimumPressDuration = 0
        cardView1.addGestureRecognizer(longGesture)
        
        //   pivotCenter = cardView.center
        
    }
    
    func displaySliderCards() {
        
        
        let wid : CGFloat = 280
        let ht : CGFloat = 500
        
        
        let sliderView = UIScrollView()
        sliderView.frame = CGRect(x: 0, y: 0, width: screnBounds.size.width, height: screnBounds.size.height)
        sliderView.isPagingEnabled = true
        self.view.addSubview(sliderView)
        sliderView.contentSize = CGSize(width: screnBounds.size.width*9, height: 240)
        
        sliderView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        
        

        
        for i in 0...8 {
            
            
            let removeButton = UIButton()
            removeButton.frame = self.view.bounds
            removeButton.addTarget(self, action: #selector(removeByTap(btn:)), for: .touchUpInside)
            sliderView.addSubview(removeButton)
            
            let cardView = UIView()
            cardView.frame = CGRect(x: screnBounds.size.width*CGFloat(i) + (screnBounds.size.width/2-wid/2), y: screnBounds.size.height/2-ht/2, width: wid, height: ht)
            sliderView.addSubview(cardView)
            cardView.backgroundColor = UIColor.lightGray
            
            removeButton.center = cardView.center
            
            cardView.layer.cornerRadius = 4
            cardView.layer.shadowColor = UIColor.black.cgColor
            cardView.layer.shadowOffset = CGSize(width: 0, height: 0)
            cardView.layer.shadowRadius = 4
            cardView.layer.masksToBounds = false
            cardView.layer.shadowOpacity = 0.2
            
            let sb = UIStoryboard(name: "LoggedIn", bundle: nil)
            let vc : OthersProfileVC = sb.instantiateViewController(withIdentifier: "OthersProfileVC") as! OthersProfileVC
            self.addChildViewController(vc)
            cardView.addSubview(vc.view)
            vc.didMove(toParentViewController: self)
            vc.view.frame = cardView.bounds
            vc.view.layer.cornerRadius = 4
            vc.view.layer.masksToBounds = true
            
            vc.delegate = self
            
//            let cardView1 = UIView()
//            cardView1.frame = cardView.bounds
//            cardView.addSubview(cardView1)
//            
//            let tap = UITapGestureRecognizer(target: self, action: #selector(gotoSpecific))
//            tap.numberOfTapsRequired = 1
//            tap.numberOfTouchesRequired = 1
//            tap.addTarget(self, action: #selector(gotoSpecific))
//            cardView1.addGestureRecognizer(tap)
            
        }
        
        
        
    }
    
    func removeByTap(btn : UIButton) {
        btn.superview?.removeFromSuperview()
    }
    
    
    var pivotCenterx = CGFloat()
    
    var finalRotation = CGFloat()
    func moveViewWithGesture( gesture : UILongPressGestureRecognizer) {
        
        if gesture.state == .began {
            
            pivotCenterx = screnBounds.size.width/2
            
            finalRotation = 0
            
        }
        else if gesture.state == .changed {
            
            
            
            let currentPoint = gesture.location(in: view.superview)
            
            let xDiff = (gesture.view?.superview?.center.x)! - currentPoint.x
            let yDiff = (gesture.view?.superview?.center.y)! - currentPoint.y
            
            print(xDiff)
            
            gesture.view?.superview?.center = CGPoint(x: (gesture.view?.superview?.center.x)!-xDiff, y: (gesture.view?.superview?.center.y)!-yDiff)
            
            let rotation : CGFloat = xDiff * (-0.002)
            
            finalRotation = finalRotation - rotation
            
            print("Middle : \(finalRotation)")
            
            gesture.view?.superview?.transform = (gesture.view?.superview?.transform.rotated(by: CGFloat(rotation)))!
            
            //            if (gesture.view?.superview?.center.x)! < pivotCenterx {
            //                gesture.view?.superview?.transform = (gesture.view?.superview?.transform.rotated(by: CGFloat(-0.005)))!
            //            }
            //            else {
            //                gesture.view?.superview?.transform = (gesture.view?.superview?.transform.rotated(by: CGFloat(0.005)))!
            //            }
            
            pivotCenterx = (gesture.view?.superview?.center.x)!
            
            
            
        }
        else if gesture.state == .ended {
            
            let currentPoint = gesture.location(in: view.superview)
            
            
            
            if currentPoint.x < screnBounds.size.width/2 - 100 {
                
                
                
                
                UIView.animate(withDuration: 0.4, animations: {
                    gesture.view?.superview?.center = CGPoint(x: -250, y: (gesture.view?.superview?.center.y)!+30)
                }, completion: { (bool) in
                    gesture.view?.superview?.removeFromSuperview()
                })
                
                
                
            }
            else if currentPoint.x > screnBounds.size.width/2 + 100 {
                
                UIView.animate(withDuration: 0.4, animations: {
                    gesture.view?.superview?.center = CGPoint(x: self.screnBounds.size.width+250, y: (gesture.view?.superview?.center.y)!+30)
                }, completion: { (bool) in
                    gesture.view?.superview?.removeFromSuperview()
                    //                self.gotoSpecific()
                })
                
            }
            else {
                
                if finalRotation == 0 {
                    self.gotoSpecific()
                }
                
                print("Final : \(finalRotation)")
                
                UIView.animate(withDuration: 0.2, animations: {
                    gesture.view?.superview?.center = CGPoint(x: self.screnBounds.size.width/2, y: self.screnBounds.size.height/2)
                    gesture.view?.superview?.transform = (gesture.view?.superview?.transform.rotated(by: CGFloat(self.finalRotation)))!
                }, completion: { (bool) in
                    
                })
                
                
                
            }
            
        }
        
        
        
    }
    

    func gotoSpecific() {
        
        let sb = UIStoryboard(name: "LoggedIn", bundle: nil)
        let vc : SpecificLocationVC = sb.instantiateViewController(withIdentifier: "SpecificLocationVC") as! SpecificLocationVC
        self.pushToViewController(controller: vc, direction: .rightToLeft)
        
    }
    
    
    func gotoProfileDetailsFormOthers() {
        let sb = UIStoryboard(name: "LoggedIn", bundle: nil)
        let vc : ProfileVC = sb.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        vc.fromOthers = true
        self.pushToViewController(controller: vc, direction: .rightToLeft)
    }


}

class SpecificLocationCollectionCell: UICollectionViewCell {
    
    var delegate: SpecificLocDelegate!
    @IBOutlet weak var proPic: UIImageView!
    @IBOutlet weak var nameLab: UILabel!
    override func awakeFromNib() {
        //
    }
    @IBAction func gotoProfile(_ sender: UIButton) {
        
        self.delegate.gotoProfileAction!()
        
    }
}

class SpecificLocationTableCell: UITableViewCell {
    
    
    var delegate: SpecificLocDelegate!
    
    @IBOutlet weak var proPic: UIImageView!
    @IBOutlet weak var proPic2: UIImageView!
    @IBOutlet weak var proPic3: UIImageView!
    @IBOutlet weak var proPic4: UIImageView!
    @IBOutlet weak var proPic5: UIImageView!
    
    @IBOutlet weak var nameLab: UILabel!
    @IBOutlet weak var descLab: UILabel!
    
    
    override func awakeFromNib() {
        
        proPic.layer.cornerRadius = 25
        proPic.layer.masksToBounds = true
        
        proPic2.layer.cornerRadius = 25
        proPic2.layer.masksToBounds = true
        
        proPic3.layer.cornerRadius = 25
        proPic3.layer.masksToBounds = true
        
        proPic4.layer.cornerRadius = 25
        proPic4.layer.masksToBounds = true
        
        proPic5.layer.cornerRadius = 25
        proPic5.layer.masksToBounds = true
        //
    }
    
    @IBAction func gotoProfile(_ sender: UIButton) {
        
        self.delegate.gotoProfileAction!()
        
    }
    
}


@objc protocol SpecificLocDelegate : class {
    
    
    @objc optional func gotoProfileAction()
    
}
