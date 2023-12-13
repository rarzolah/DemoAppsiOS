//
//  HomeFlightPresenter.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 11/12/23.
//

import Foundation

class HomeFlightPresenter: HomeFlightPresenterProtocol{

    
    var view: HomeFlightViewProtocol?
    
    var interactor: HomeFlightInteractorInputProtocol?
    
    var router: HomeFlightRouterProtocol?
    
    func loadingView() {
        interactor?.getDemoData()
    }
}

extension HomeFlightPresenter: HomeFlightInteractorOutputProtocol{
    func catchResponse(withMessage: String) {
        
    }
}
