//
//  AMFilterViewData.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 12/12/23.
//

import UIKit

public struct AMFilterViewData{
    public var title: String
    public var titleFlight: NSMutableAttributedString
    public var imageFilter: UIImage?
    
    public init(title: String, titleFlight: NSMutableAttributedString, imageFilter: UIImage? = nil) {
        self.title = title
        self.titleFlight = titleFlight
        self.imageFilter = imageFilter
    }
}
