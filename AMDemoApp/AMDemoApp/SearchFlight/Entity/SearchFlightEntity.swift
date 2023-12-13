//
//  SearchFlightEntity.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 13/12/23.
//

import Foundation

struct SearchData{
    var flightNumber: String?
    var origin: String?
    var destination: String?
    var dateDeparture: String?
    
    public init(flightNumber: String? = nil, origin: String? = nil, destination: String? = nil, dateDeparture: String? = nil) {
        self.flightNumber = flightNumber
        self.origin = origin
        self.destination = destination
        self.dateDeparture = dateDeparture
    }
}
