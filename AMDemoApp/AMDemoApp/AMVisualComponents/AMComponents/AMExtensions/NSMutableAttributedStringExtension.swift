//
//  NSMutableAttributedStringExtension.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 12/12/23.
//

import UIKit

public extension NSMutableAttributedString{
    
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
