//
//  UILabelExtension.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 13/12/23.
//

import UIKit

public extension UILabel{
 
    /**
     Function returns an label with custom data
        - Parameter text: The string data
        - Parameter style: The label style
        - Parameter textAlignment: The text alingment
        - Parameter textColor: The color to the string data
     */
    static func label(text: String, style: AMLabelStyles, textAlignment: NSTextAlignment = .left, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = style.font
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = 0
        return label
    }
}
