//
//  File.swift
//  Sofo
//
//  Created by Gurudeeksha  L on 20/12/17.
//  Copyright © 2017 Twixt. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return self[Range(start ..< end)]
    }
}
