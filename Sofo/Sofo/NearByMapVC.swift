//
//  NearByMapVC.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 08/12/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import UIKit
import GoogleMaps
import Koloda

class NearByMapVC: UIViewController, KolodaViewDelegate, KolodaViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let screnBounds = UIScreen.main.bounds

    @IBOutlet weak var mapBack: UIView!
    @IBOutlet weak var kolodaView: KolodaView!
    @IBOutlet weak var cardView: UIView!
    
    var mapView = GMSMapView()
    
    @IBOutlet weak var buttonCollection: UICollectionView!
    
    @IBOutlet weak var bottomScroll: UIScrollView!
    
    var cirlce: GMSCircle!
    
    let buttonTitles = ["Around me", "Clubs", "Nightlife", "Food"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        cardView.layer.cornerRadius = 4
//        cardView.layer.shadowColor = UIColor.black.cgColor
//        cardView.layer.shadowOffset = CGSize(width: 0, height: 0)
//        cardView.layer.shadowRadius = 4
//        cardView.layer.masksToBounds = false
//        cardView.layer.shadowOpacity = 0.2
        
        buttonCollection.delegate = self
        buttonCollection.dataSource = self
        
        
        
        
        let camera = GMSCameraPosition.camera(withLatitude: 40.7128, longitude: -75.0059, zoom: 14.0)
        //mapView = GMSMapView.map(withFrame: CGRect(x:0,y:0,width:screenBounds.size.width,height:screenBounds.size.height-120), camera: camera)
        mapView = GMSMapView.map(withFrame: mapBack.bounds, camera: camera)
        // view = mapView
        
      //  mapView.delegate = self
        mapBack.addSubview(mapView)
        
        
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(40.7158), longitude: CLLocationDegrees(-75.0059))
        marker.map = mapView
        marker.icon = UIImage(named: "MapPin.png")
        
        
        
        cirlce = GMSCircle(position: CLLocationCoordinate2D(latitude: CLLocationDegrees(40.7168), longitude: CLLocationDegrees(-75.0059)), radius: CLLocationDistance(800))
        cirlce.map = mapView
        
        
        cirlce.fillColor = UIColor(red: 50/255, green: 160/255, blue: 245/255, alpha: 0.15)
        cirlce.strokeColor = UIColor.clear
      //  cirlce.position = camera.target
        
        
//        for _ in 0...6 {
//            
//            displayCards()
//            
//        }
        
        
        self.displaySliderCards()
        
        
        
     
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displaySliderCards() {
        
        let sliderView = UIScrollView()
        sliderView.frame = CGRect(x: 0, y: screnBounds.size.height-240, width: screnBounds.size.width, height: 240)
        sliderView.isPagingEnabled = true
        self.view.addSubview(sliderView)
        sliderView.contentSize = CGSize(width: screnBounds.size.width*9, height: 240)
        
        for i in 0...8 {
            
            let cardView = UIView()
            cardView.frame = CGRect(x: screnBounds.size.width*CGFloat(i) + (screnBounds.size.width/2-150), y: 40, width: 300, height: 160)
            sliderView.addSubview(cardView)
            cardView.backgroundColor = UIColor.lightGray
            
            cardView.layer.cornerRadius = 4
            cardView.layer.shadowColor = UIColor.black.cgColor
            cardView.layer.shadowOffset = CGSize(width: 0, height: 0)
            cardView.layer.shadowRadius = 4
            cardView.layer.masksToBounds = false
            cardView.layer.shadowOpacity = 0.2
            
            let sb = UIStoryboard(name: "LoggedIn", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "tinderLikeVC")
            self.addChildViewController(vc)
            cardView.addSubview(vc.view)
            vc.didMove(toParentViewController: self)
            vc.view.frame = cardView.bounds
            vc.view.layer.cornerRadius = 4
            vc.view.layer.masksToBounds = true
            
            let cardView1 = UIView()
            cardView1.frame = cardView.bounds
            cardView.addSubview(cardView1)
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(gotoSpecific))
            tap.numberOfTapsRequired = 1
            tap.numberOfTouchesRequired = 1
            tap.addTarget(self, action: #selector(gotoSpecific))
            cardView1.addGestureRecognizer(tap)
            
        }
        
        
        
    }
    
    func displayCards() {
        
        let cardView = UIView()
        cardView.frame = CGRect(x: screnBounds.size.width/2-150, y: screnBounds.size.height-200, width: 300, height: 160)
        self.view.addSubview(cardView)
        cardView.backgroundColor = UIColor.lightGray
        
        cardView.layer.cornerRadius = 4
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cardView.layer.shadowRadius = 4
        cardView.layer.masksToBounds = false
        cardView.layer.shadowOpacity = 0.2
        
        let sb = UIStoryboard(name: "LoggedIn", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "tinderLikeVC")
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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(gotoSpecific))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        tap.addTarget(self, action: #selector(gotoSpecific))
        cardView1.addGestureRecognizer(tap)
        
        
        let longGesture = UILongPressGestureRecognizer()
        longGesture.addTarget(self, action: #selector(moveViewWithGesture(gesture:)))
        longGesture.numberOfTapsRequired = 0
        longGesture.numberOfTouchesRequired = 1
        longGesture.minimumPressDuration = 0
        cardView1.addGestureRecognizer(longGesture)
        
     //   pivotCenter = cardView.center
        
    }
    
    func gotoSpecific() {
        
        let sb = UIStoryboard(name: "LoggedIn", bundle: nil)
        let vc : SpecificLocationVC = sb.instantiateViewController(withIdentifier: "SpecificLocationVC") as! SpecificLocationVC
        self.pushToViewController(controller: vc, direction: .rightToLeft)
    
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
                gesture.view?.superview?.center = CGPoint(x: self.screnBounds.size.width/2, y: self.screnBounds.size.height-120)
                gesture.view?.superview?.transform = (gesture.view?.superview?.transform.rotated(by: CGFloat(self.finalRotation)))!
            }, completion: { (bool) in

            })
            
            
            
            }
            
        }
        
    }

    
    @IBAction func backAction(_ sender: UIButton) {
        
        self.popToPrevious(direction: .bottomToTop)
        
    }

    var images = [#imageLiteral(resourceName: "sample.jpg"),#imageLiteral(resourceName: "sample.jpg")]
    
    // MARK: - Navigation

    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return images.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return UIImageView(image: images[index])
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)?[0] as? OverlayView
    }
    
    
    // MARK: - Collectionview Datasource and delegates
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonTitles.count+1
    }
    
    
    var selectedIndex = 0
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.row == buttonTitles.count {
            
            let cell : AddItemMapCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddItemMapCollectionCell",
                                                                                 for: indexPath) as! AddItemMapCollectionCell
            
            return cell
            
        }
        else {
            
            
            let cell : NearByCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NearByCollectionCell",
                                                                                 for: indexPath) as! NearByCollectionCell
            
            cell.vc = self
            
            cell.button.setTitle(buttonTitles[indexPath.row], for: .normal)
            cell.button.tag = indexPath.row
            
            if indexPath.row == selectedIndex {
                
                cell.button.backgroundColor = UIColor.primaryColor()
                cell.button.setTitleColor(UIColor.white, for: .normal)
                
            }
            else {
                
                cell.button.backgroundColor = UIColor.white
                cell.button.setTitleColor(UIColor.primaryColor(), for: .normal)
                
            }
            
            
            
            return cell
            
        }
        
        
    }
    
    func selectedCellIndex(_index:Int) {
        
        selectedIndex = _index
        buttonCollection.reloadData()
        
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        self.displaySearch()
    }

    

}


class NearByCollectionCell: UICollectionViewCell {
    
    var vc = NearByMapVC()
    
    @IBOutlet weak var button: UIButton!
    override func awakeFromNib() {
        //
        
        button.layer.borderColor = UIColor.primaryColor().cgColor
        button.layer.borderWidth = 1
        
        
    }
    
    
    @IBAction func ButtonAction(_ sender: UIButton) {
        
        vc.selectedCellIndex(_index: sender.tag)
        
    }
}


class AddItemMapCollectionCell: UICollectionViewCell {
    
    
    override func awakeFromNib() {
        
        
        
        
    }
    
    
    
}
