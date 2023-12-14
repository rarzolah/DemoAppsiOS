//
//  HomeFlightRemoteDataManager.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 11/12/23.
//

import Foundation

class HomeFlightRemoteDataManager: HomeFlightRemoteDataManagerInputProtocol{
    var remoteRequestHandler: HomeFlightRemoteDataManagerOutputProtocol?
    
    func getDemoData(file: SegmentedTitles){
        if let url = Bundle.main.url(forResource: file.jsonFile, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(FlightData.self, from: data)

                remoteRequestHandler?.pushFlightsData(flightData: jsonData.flightStatusCollection)
            } catch {
                remoteRequestHandler?.catchResponse(withMessage: "error:\(error)")
            }
        }
    }
}
