//
//  AMExtensions.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 11/12/23.
//

import UIKit

public extension UIFont{
    
    static func registerFont(){
        registerFont(withFilenameString: "Garnett-Bold.ttf", bundle: .main)
        registerFont(withFilenameString: "Garnett-Regular.ttf", bundle: .main)
        registerFont(withFilenameString: "Garnett-Semibold.ttf", bundle: .main)
    }
    
    static func registerFont(withFilenameString filenameString: String, bundle: Bundle) {
        guard let pathForResourceString = bundle.path(forResource: filenameString, ofType: nil) else {
            print("Error for pathForResourceString")
            return
        }

        guard let fontData = NSData(contentsOfFile: pathForResourceString) else {
            print("Error for fontData")
            return
        }

        guard let dataProvider = CGDataProvider(data: fontData) else {
            print("Error for dataProvider")
            return
        }

        guard let font = CGFont(dataProvider) else {
            print("Error for font")
            return
        }

        var errorRef: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &errorRef) {
            print("UIFont+:  Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
        }
    }
    
    static func systemBold(size fontSize: CGFloat) -> UIFont? {
        return UIFont(name: "Garnett-Bold", size: fontSize)
    }
    static func systemRegular(size fontSize: CGFloat) -> UIFont? {
        return UIFont(name: "Garnett-Regular", size: fontSize)
    }
    static func systemSemiBold(size fontSize: CGFloat) -> UIFont? {
        return UIFont(name: "Garnett-SemiBold", size: fontSize)
    }
    
    static func system(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont? {
        switch weight {
        case .bold:
            return systemBold(size: fontSize)
        case .semibold:
            return systemSemiBold(size: fontSize)
        case .regular:
            return systemRegular(size: fontSize)
        default:
            return systemBold(size: fontSize)
        }
    }
    
}
