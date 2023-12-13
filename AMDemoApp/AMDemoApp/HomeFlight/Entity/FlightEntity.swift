//
//  FlightEntity.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 12/12/23.
//

import Foundation

struct FlightData: Codable {
    let flightStatusCollection: [FlightStatusCollection]
}

// MARK: - FlightStatusCollection
struct FlightStatusCollection: Codable {
    let status, boardingTerminal, boardingGate, boardingTime: String
    let estimatedDepartureTime, estimatedArrivalTime: String
    let delayInMinutes: Int
    let arrivalTerminal, arrivalGate: String
    let segment: Segment
    let outGate: OutGate
    let legType: String
    let totalFlightTimeInMinutes: Int
}

// MARK: - Segment
struct Segment: Codable {
    let segmentCode, departureAirport, arrivalAirport, departureDateTime: String
    let arrivalDateTime, flightStatus, operatingCarrier, marketingCarrier: String
    let operatingFlightCode, marketingFlightCode: String
    let flightDurationInMinutes: Int
    let aircraftType: String
}

// MARK: - OutGate
struct OutGate: Codable {
    let accuracy, dateTimeUTC, dateTimeLocal, sourceType: String

    enum CodingKeys: String, CodingKey {
        case accuracy
        case dateTimeUTC = "dateTimeUtc"
        case dateTimeLocal, sourceType
    }
}
