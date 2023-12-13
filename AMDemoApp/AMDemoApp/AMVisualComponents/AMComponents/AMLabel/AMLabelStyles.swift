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
    
    case titleButtonStep
    
    case titleFilter
    case titleFilterLabel
    
    case titleButtonMain
    
    case titleLabelInformation
    
    var font: UIFont? {
        switch self{
        case .title:
            return UIFont.systemBold(size: 32)
        case .subTitle:
            return UIFont.systemRegular(size: 22)
        case .titleButtonStep:
            return UIFont.systemSemiBold(size: 12)
        case .titleFilter:
            return UIFont.systemRegular(size: 10)
        case .titleFilterLabel:
            return UIFont.systemBold(size: 16)
        case .titleButtonMain:
            return UIFont.systemSemiBold(size: 16)
        case .titleLabelInformation:
            return UIFont.systemRegular(size: 12)
        }
    }
}
