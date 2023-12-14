//
//  SearchFlightInteractor.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 13/12/23.
//

import Foundation

class SearchFlightInteractor: SearchFlightInteractorInputProtocol{
    
    var presenter: SearchFlightInteractorOutputProtocol?
    var remoteDatamanager: SearchFlightRemoteDataManagerInputProtocol?
    
    func getDemoData(file: SegmentedTitles){
        remoteDatamanager?.getDemoData(file: file)
    }
}

extension SearchFlightInteractor: SearchFlightRemoteDataManagerOutputProtocol{
    func pushFlightsData(flightData: [FlightStatusCollection]) {
        print(flightData)
    }
    
    func catchResponse(withMessage: String) {
        print(withMessage)
    }
}
