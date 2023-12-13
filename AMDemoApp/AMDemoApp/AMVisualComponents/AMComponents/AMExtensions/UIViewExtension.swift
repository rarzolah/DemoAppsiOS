//
//  UIViewExtension.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 12/12/23.
//

import UIKit

public extension UIView{
    
    func addLayerWithColor(cornerRadius: CGFloat, borderWidth: CGFloat, withColor: UIColor) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = withColor.cgColor
    }
}
