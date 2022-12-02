//
//  GlobalCode.swift
//  FirstApp
//
//  Created by José Guerra on 30-11-22.
//

import Foundation
import UIKit

class DeviceSizes {
    
    
    static var shared: DeviceSizes = {
        
        let instance = DeviceSizes()
        
        return instance
    }()
    
    func globalHeight() -> CGFloat {
        
        return UIScreen.main.bounds.width
        
    }
    
}
