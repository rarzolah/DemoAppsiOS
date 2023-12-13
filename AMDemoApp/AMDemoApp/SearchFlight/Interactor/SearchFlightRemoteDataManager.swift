//
//  SearchFlightRemoteDataManager.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 13/12/23.
//

import Foundation

class SearchFlightRemoteDataManager: SearchFlightRemoteDataManagerInputProtocol{
    var remoteRequestHandler: SearchFlightRemoteDataManagerOutputProtocol?
    
    func getDemoData(){
        if let url = Bundle.main.url(forResource: "fileName", withExtension: "json") {
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
    
    func loadJson(filename fileName: String) -> [FlightStatusCollection]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(FlightData.self, from: data)
                print(jsonData.flightStatusCollection)
                return jsonData.flightStatusCollection
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
