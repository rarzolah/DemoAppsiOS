//
//  AMGenericEnums.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 13/12/23.
//

import Foundation

// MARK: - SegmentedTitle
enum SegmentedTitle: String {
    case flightNumber
    case destination
    
    var title: String {
        switch self {
        case .flightNumber:
            return "Flight Number"
        case .destination:
            return "Destination"
        }
    }
}
