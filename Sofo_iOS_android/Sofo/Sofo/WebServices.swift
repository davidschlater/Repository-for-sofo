//
//  WebServices.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 30/11/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import UIKit

class WebServices: NSObject {
    
    var delegate : WebServiceDelegate?
    
    func loginRequest(username:String, pasword:String) {
        
    }
    
    enum ConnectionResult {
        case success(NSDictionary)
        case failure()
    }
    
    func getHistoryKeys(searchterm: String, completion: @escaping (ConnectionResult) -> ()) {
        var success = Bool()
        success = true
        
            if !success {
                completion(.failure())
            } else {
                let dict = ["Key":"Val"]
                completion(.success(dict as NSDictionary))
            }
        
    }

    

}

@objc protocol WebServiceDelegate : class {
    
}
