//
//  AMLabel.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 12/12/23.
//

import UIKit

open class AMLabel: UILabel {

    public static func label(text: String, style: AMLabelStyles, textAlignment: NSTextAlignment = .left, textColor: UIColor) -> AMLabel {
        let label = AMLabel()
        label.text = text
        label.font = style.font
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = 0
        return label
    }
}
