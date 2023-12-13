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
    
    func getDemoData(){
        remoteDatamanager?.getDemoData()
    }
}

extension SearchFlightInteractor: SearchFlightRemoteDataManagerOutputProtocol{
    func pushFlightsData(flightData: [FlightStatusCollection]) {

    }
    
    func catchResponse(withMessage: String) {
        
    }
}
