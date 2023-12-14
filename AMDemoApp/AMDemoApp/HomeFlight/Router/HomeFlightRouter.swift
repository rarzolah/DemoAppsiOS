//
//  HomeFlightRouter.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 11/12/23.
//

import UIKit

class HomeFlightRouter: HomeFlightRouterProtocol {
    // MARK: - Create Module HomeFlight
    class func createHomeFlightModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "HomeFlightID")
        if let view = navController.children.first as? HomeFlight {
            let presenter: HomeFlightPresenterProtocol & HomeFlightInteractorOutputProtocol = HomeFlightPresenter()
            let interactor: HomeFlightInteractorInputProtocol & HomeFlightRemoteDataManagerOutputProtocol = HomeFlightInteractor()
            let remoteDataManager: HomeFlightRemoteDataManagerInputProtocol = HomeFlightRemoteDataManager()
            let router: HomeFlightRouterProtocol = HomeFlightRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }

    // MARK: - Properties
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "HomeFlight", bundle: .main)
    }
}
