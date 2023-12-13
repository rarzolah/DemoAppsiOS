//
//  AMLabelStyles.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 11/12/23.
//

import UIKit

public enum AMLabelStyles{

    case title
    case subTitle
    
    var font: UIFont? {
        switch self{
            
        case .title:
            return UIFont.systemBold(size: 32)
            
        case .subTitle:
            return UIFont.systemRegular(size: 22)
        }
    }
}
