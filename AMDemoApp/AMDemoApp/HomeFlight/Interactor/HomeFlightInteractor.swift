//
//  HomeFlightInteractor.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 11/12/23.
//

import Foundation

class HomeFlightInteractor: HomeFlightInteractorInputProtocol{
    
    var presenter: HomeFlightInteractorOutputProtocol?
    
    var remoteDatamanager: HomeFlightRemoteDataManagerInputProtocol?
    
    func getDemoData(file: SegmentedTitles){
        remoteDatamanager?.getDemoData(file: file)
    }
}

extension HomeFlightInteractor: HomeFlightRemoteDataManagerOutputProtocol{
    func pushFlightsData(flightData: [FlightStatusCollection]) {

    }
    
    func catchResponse(withMessage: String) {
        
    }
}
