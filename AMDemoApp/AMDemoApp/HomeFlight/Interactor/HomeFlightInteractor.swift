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
    
    
}

extension HomeFlightInteractor: HomeFlightRemoteDataManagerOutputProtocol{
    func catchResponse(withMessage: String) {
        
    }
}
