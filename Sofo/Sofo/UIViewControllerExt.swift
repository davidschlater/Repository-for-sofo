//
//  UIViewControllerExt.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 29/11/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView
import GoogleSignIn

extension UIViewController: NVActivityIndicatorViewable, MenuDelegate {
    
    
    enum moveDirection {
        case leftToRight
        case rightToLeft
        case topToBottom
        case bottomToTop
        
    }
    
    struct PopDirection {
        var direction:moveDirection
        init(direction:moveDirection) {
            self.direction = direction
        }
    }

    
    
    func startLoading() {
        
//        let bkView = UIView()
//        bkView.backgroundColor = UIColor.black
//        bkView.frame = CGRect(x: 0, y: 0, width: 140, height: 120)
//        bkView.center = self.view.center
//        view.addSubview(bkView)
//        
//        bkView.layer.cornerRadius = 5
        
        startAnimating(CGSize(width:60, height:60), message: "", messageFont: UIFont.systemFont(ofSize: 12), type: .ballTrianglePath, color: UIColor.white, padding: 1, displayTimeThreshold: 1, minimumDisplayTime: 1, backgroundColor: UIColor.black.withAlphaComponent(0.5), textColor: UIColor.white)
        
    }
    
    func stopLoading() {
        
        stopAnimating()
    }
    
    
    func openLeftMenu() {
        
        let sb = UIStoryboard(name: "LoggedIn", bundle: nil)
        let vc : MenuVC = sb.instantiateViewController(withIdentifier: "MenuVC") as! MenuVC
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        
        
        present(vc, animated: false, completion: nil)
        
        
        
        
        
    }
    
    // MARK: - Menu Delegate
    
    func menuItemClicked(index: Int) {
        print(index)
        
        switch index {
        case 0:
            let sb = UIStoryboard(name: "LoggedIn", bundle: nil)
            let vc : ProfileVC = sb.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
            self.pushToViewController(controller: vc, direction: .rightToLeft)
            break
        case 1:
            let sb = UIStoryboard(name: "Chat", bundle: nil)
            let vc : ContactListVC = sb.instantiateViewController(withIdentifier: "ContactListVC") as! ContactListVC
            vc.popDirection = PopDirection(direction: .leftToRight)
            self.pushToViewController(controller: vc, direction: .rightToLeft)

            break
        case 2:
            let sb = UIStoryboard(name: "Chat", bundle: nil)
            let vc : ContactListVC = sb.instantiateViewController(withIdentifier: "ContactListVC") as! ContactListVC
            vc.popDirection = PopDirection(direction: .leftToRight)
            self.pushToViewController(controller: vc, direction: .rightToLeft)
            break
        case 3:
            let sb = UIStoryboard(name: "LoggedIn", bundle: nil)
            let vc : SettingsVC = sb.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
            vc.popDirection = PopDirection(direction: .leftToRight)
            self.pushToViewController(controller: vc, direction: .rightToLeft)
            break
        case 4:
            let sb = UIStoryboard(name: "Upgrade", bundle: nil)
            let vc : UpgradeVC = sb.instantiateViewController(withIdentifier: "UpgradeVC") as! UpgradeVC
            self.pushToViewController(controller: vc, direction: .rightToLeft)
            break
        default:
            break
        }
        
    }
    
    func logoutClicked() {
        self.navigationController?.popToViewController(Singleton.sharedInstance.loginVC, animated: true)
        GIDSignIn.sharedInstance().signOut()
    }
    
    
    func pushToViewController(controller:UIViewController,direction:moveDirection ) {
        
        switch direction {
        case .leftToRight:
            let transition = CATransition()
            transition.duration = 0.75
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromLeft
            self.navigationController?.view.layer.add(transition, forKey: nil)
            _ = self.navigationController?.pushViewController(controller, animated: false)
            break
        case .rightToLeft:
            let transition = CATransition()
            transition.duration = 0.75
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromRight
            self.navigationController?.view.layer.add(transition, forKey: nil)
            _ = self.navigationController?.pushViewController(controller, animated: false)
            break
        case .topToBottom:
            let transition = CATransition()
            transition.duration = 0.75
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromBottom
            self.navigationController?.view.layer.add(transition, forKey: nil)
            _ = self.navigationController?.pushViewController(controller, animated: false)
            break
        case .bottomToTop:
            let transition = CATransition()
            transition.duration = 0.75
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromTop
            self.navigationController?.view.layer.add(transition, forKey: nil)
            _ = self.navigationController?.pushViewController(controller, animated: false)
            break
        default:
            break
        }
        
    }
    
    func pushToViewControllerFadeOut(controller:UIViewController) {
        
            let transition = CATransition()
            transition.duration = 0.75
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFade
            self.navigationController?.view.layer.add(transition, forKey: nil)
            _ = self.navigationController?.pushViewController(controller, animated: false)
        
    }

    
    func popToViewController(controller:UIViewController,direction:moveDirection ) {
        
        switch direction {
        case .leftToRight:
            let transition = CATransition()
            transition.duration = 0.75
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromLeft
            self.navigationController?.view.layer.add(transition, forKey: nil)
            _ = self.navigationController?.popToViewController(controller, animated: false)
            break
        case .rightToLeft:
            let transition = CATransition()
            transition.duration = 0.75
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromRight
            self.navigationController?.view.layer.add(transition, forKey: nil)
            _ = self.navigationController?.popToViewController(controller, animated: false)
            break
        case .topToBottom:
            let transition = CATransition()
            transition.duration = 0.75
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromBottom
            self.navigationController?.view.layer.add(transition, forKey: nil)
            _ = self.navigationController?.popToViewController(controller, animated: false)
            break
        case .bottomToTop:
            let transition = CATransition()
            transition.duration = 0.75
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromTop
            self.navigationController?.view.layer.add(transition, forKey: nil)
            _ = self.navigationController?.popToViewController(controller, animated: false)
            break
        default:
            break
        }
        
    }

    
    func popToPrevious(direction:moveDirection ) {
        
        switch direction {
        case .leftToRight:
            let transition = CATransition()
            transition.duration = 0.75
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromLeft
            self.navigationController?.view.layer.add(transition, forKey: nil)
            _ = self.navigationController?.popViewController(animated: false)
            break
        case .rightToLeft:
            let transition = CATransition()
            transition.duration = 0.75
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromRight
            self.navigationController?.view.layer.add(transition, forKey: nil)
            _ = self.navigationController?.popViewController(animated: false)
            break
        case .topToBottom:
            let transition = CATransition()
            transition.duration = 0.75
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromBottom
            self.navigationController?.view.layer.add(transition, forKey: nil)
            _ = self.navigationController?.popViewController(animated: false)
            break
        case .bottomToTop:
            let transition = CATransition()
            transition.duration = 0.75
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromTop
            self.navigationController?.view.layer.add(transition, forKey: nil)
            _ = self.navigationController?.popViewController(animated: false)
            break
        default:
            break
        }
        
    }
    
    
    func displaySearch() {
        
        let screnBounds = UIScreen.main.bounds
        
        let searchView = UIView()
        searchView.frame = CGRect(x: screnBounds.size.width, y: 18, width: screnBounds.size.width, height: 50)
        self.view.addSubview(searchView)
        
        let sb = UIStoryboard(name: "LoggedIn", bundle: nil)
        let vc : SearchVC = sb.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
        self.addChildViewController(vc)
        searchView.addSubview(vc.view)
        
        vc.didMove(toParentViewController: self)
        vc.view.frame = searchView.bounds
        vc.view.layer.masksToBounds = true
        
        
        vc.vcSuperView = searchView
        
        UIView.animate(withDuration: 0.5, animations: { 
            searchView.frame = CGRect(x: 0, y: 18, width: screnBounds.size.width, height: 50)
        }) { (bool) in
            
        }
        
    }
    
    
}
