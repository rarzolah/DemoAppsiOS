//
//  SearchFlightRouter.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 13/12/23.
//

import UIKit

class SearchFlightRouter: SearchFlightRouterProtocol {

    // MARK: - Create Module SearchFlight
    class func createSearchFlightModule(with searchData: SearchData) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "SearchFlightID")
        if let view = navController as? SearchFlight {
            let presenter: SearchFlightPresenterProtocol & SearchFlightInteractorOutputProtocol = SearchFlightPresenter()
            let interactor: SearchFlightInteractorInputProtocol & SearchFlightRemoteDataManagerOutputProtocol = SearchFlightInteractor()
            let remoteDataManager: SearchFlightRemoteDataManagerInputProtocol = SearchFlightRemoteDataManager()
            let router: SearchFlightRouterProtocol = SearchFlightRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            presenter.searchData = searchData
            interactor.presenter = presenter
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }

    // MARK: - Properties
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "SearchFlight", bundle: .main)
    }
}
