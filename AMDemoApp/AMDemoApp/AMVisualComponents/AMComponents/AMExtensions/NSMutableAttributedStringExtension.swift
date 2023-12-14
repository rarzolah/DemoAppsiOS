//
//  NSMutableAttributedStringExtension.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 12/12/23.
//

import UIKit

public extension NSMutableAttributedString{
    /**
     Function that customize a label text with an attributed
        - Parameter textToFind: Thetext to find
        - Parameter color: The uicolor to apply
        - Parameter font: The label style font
     */
    func colorForTextCustom(_ textToFind: String?, with color: UIColor, font: AMLabelStyles) {
        var range: NSRange = NSMakeRange(0, self.length)
        if let text = textToFind{
            range = self.mutableString.range(of: text, options: .caseInsensitive)
        }
        if range.location != NSNotFound {
            addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
            addAttribute(NSAttributedString.Key.font, value: font.font as Any, range: range)
        }
    }
}
