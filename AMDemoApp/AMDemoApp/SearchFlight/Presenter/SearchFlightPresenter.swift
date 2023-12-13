//
//  SearchFlightPresenter.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 13/12/23.
//

import Foundation

class SearchFlightPresenter: SearchFlightPresenterProtocol{

    
    var view: SearchFlightViewProtocol?
    
    var interactor: SearchFlightInteractorInputProtocol?
    
    var router: SearchFlightRouterProtocol?
    
    func loadingView() {
        interactor?.getDemoData()
    }
}

extension SearchFlightPresenter: SearchFlightInteractorOutputProtocol{
    func catchResponse(withMessage: String) {
        
    }
}
