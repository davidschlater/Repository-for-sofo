//
//  Singleton.swift
//  FlyBooking
//
//  Created by Sanalkumar T J on 31/12/16.
//  Copyright © 2016 XtronLabs.inc. All rights reserved.
//

import UIKit
import CoreLocation

class Singleton: NSObject {
    
    var loginVC = UIViewController()
    
    static let sharedInstance : Singleton = {
       
        let instance = Singleton()
        return instance
    }()
    
    
    
    

}
