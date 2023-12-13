//
//  AMFilterViewData.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 12/12/23.
//

import UIKit

public struct AMFilterViewData{
    public var title: UILabel
    public var titleFlight: NSMutableAttributedString
    public var imageFilter: UIImage?
    
    public init(title: UILabel, titleFlight: NSMutableAttributedString, imageFilter: UIImage? = nil) {
        self.title = title
        self.titleFlight = titleFlight
        self.imageFilter = imageFilter
    }
}
