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
    var searchData: SearchData?
    
    func loadingView(file: SegmentedTitles) {
        interactor?.getDemoData(file: file)
    }
}

extension SearchFlightPresenter: SearchFlightInteractorOutputProtocol{
    func catchResponse(withMessage: String) {
        print(withMessage)
    }
}
