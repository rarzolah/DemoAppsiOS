//
//  AMSegmentedControlData.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 12/12/23.
//

import UIKit

/// It is a model for  AMSegmentedControlModel configuration
///
///In this model we can settings:  segments, selected segment index, segmented control style for AMSegmentedControl
///
///```swift
/// let segments =  ["First", "Second", "Thrid", "Another", "Last"]
/// let config = AMSegmentedControlModel(segments: segments,
///                                              selectedSegmentIndex: 2,
///                                              segmentedControlStyle: .´default´)
/// ```
public struct AMSegmentedControlModel {
    let segments: [String]
    let selectedSegmentIndex: Int
    let segmentedControlStyle: AMSegmentedControlStyle
    
    public init(segments: [String],
                selectedSegmentIndex: Int = 0,
                segmentedControlStyle: AMSegmentedControlStyle) {
        self.segments = segments
        self.selectedSegmentIndex = selectedSegmentIndex
        self.segmentedControlStyle = segmentedControlStyle
    }
}
/// AMSegmentedControlStyle provides a configuration for  AMSegmentedControl
public enum AMSegmentedControlStyle {
    case ´default´,
         custom(segmentBackgroundColor: UIColor,
                segmentedControlCornerRadius: CGFloat,
                segmentTextColor: UIColor,
                segmentTextFont: UIFont,
                selectorViewBackgroundColor: UIColor,
                selectorViewCornerRadius: CGFloat,
                selectorViewTextColor: UIColor,
                separatorColor: UIColor? = nil)
    /// segmentBackgroundColor:  provides a color for the segmented control background color
    var segmentBackgroundColor: UIColor {
        switch self {
        case.´default´:
            return .amWhite
        case .custom(let segmentBackgroundColor, _, _, _, _, _, _, _):
            return segmentBackgroundColor
        }
    }
    /// segmentedControlCornerRadius: provides a float value for the corner radius of the segmented control
    var segmentedControlCornerRadius: CGFloat {
        switch self {
        case .custom(_, let segmentedControlCornerRadius, _, _, _, _, _, _):
            return segmentedControlCornerRadius
        default:
            return 5
        }
    }
    /// segmentTextColor: provides a Color Style for the text color of the segmented control
    var segmentTextColor: UIColor {
        switch self {
        case.´default´:
            return .amBlack
        case .custom(_, _, let segmentTextColor, _, _, _, _, _):
            return segmentTextColor
        }
    }
    /// segmentTextFont: provides a font for the font style for the text of the segmented control
    var segmentTextFont: UIFont {
        switch self {
        case.´default´:
            return UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.semibold)
        case .custom(_, _, _, let segmentTextFont, _, _, _, _):
            return segmentTextFont
        }
    }
    /// selectorViewBackgroundColor:  provides a color for the background color for the view indicator of the segmented control
    var selectorViewBackgroundColor: UIColor {
        switch self {
        case.´default´:
            return .amBlack
        case .custom(_, _, _, _, let selectorViewBackgroundColor, _, _, _):
            return selectorViewBackgroundColor
        }
    }
    /// selectorViewCornerRadius: provides a float value for the corner radius of the view indicator of the segmented control
    var selectorViewCornerRadius: CGFloat {
        switch self {
        case .´default´:
            return 5
        case .custom(_, _, _, _, _, let selectorViewCornerRadius, _, _):
            return selectorViewCornerRadius
        }
    }
    /// selectorViewTextColor: provides a color for the text color of the view indicator of the segmented control
    var selectorViewTextColor: UIColor {
        switch self {
        case.´default´:
            return .amWhite
        case .custom(_, _, _, _, _, _, let selectorViewTextColor, _):
            return selectorViewTextColor
        }
    }
    /// separatorColor: provides a color for the item separator in segmented control
    var separatorColor: UIColor? {
        switch self {
        case.´default´:
            return .clear
        case .custom(_, _, _, _, _, _, _, let separatorColor):
            return separatorColor
        }
    }
}
