//
//  AMGenericEnums.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 13/12/23.
//

import Foundation

// MARK: - SegmentedTitles
enum SegmentedTitles: String {
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
    
    var index: Int{
        switch self {
        case .flightNumber:
            return 0
        case .destination:
            return 1
        }
    }
}
