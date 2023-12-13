//
//  AMComponents.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 13/12/23.
//

import UIKit

public class AMComponents: NSObject{
    static let components = AMComponents()
    
    private override init() {}
    
    func loadVisualComponents(){
        UIFont.registerFont()
    }
}
