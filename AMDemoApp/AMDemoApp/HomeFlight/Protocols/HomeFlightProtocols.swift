//
//  HomeFlightProtocols.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 11/12/23.
//

import Foundation
import UIKit

protocol HomeFlightViewProtocol: AnyObject {
    /// Presenter -> View
    var presenter: HomeFlightPresenterProtocol? { get set }
    
    func loadRemoteDataCodes(with step: SegmentedTitles) -> [UIView]
}

protocol HomeFlightRouterProtocol: AnyObject {
    /// Presenter -> Router
    static func createHomeFlightModule() -> UIViewController
}

protocol HomeFlightPresenterProtocol: AnyObject {
    /// View -> Presenter
    var view: HomeFlightViewProtocol? { get set }
    var interactor: HomeFlightInteractorInputProtocol? { get set }
    var router: HomeFlightRouterProtocol? { get set }
    
    func loadingView(file: SegmentedTitles)
}

protocol HomeFlightInteractorOutputProtocol: AnyObject {
    /// Interactor -> Presenter
    func catchResponse(withMessage: String)
}

protocol HomeFlightInteractorInputProtocol: AnyObject {
    /// Presenter -> Interactor
    var presenter: HomeFlightInteractorOutputProtocol? { get set }
    var remoteDatamanager: HomeFlightRemoteDataManagerInputProtocol? { get set }
    
    func getDemoData(file: SegmentedTitles)
}

protocol HomeFlightRemoteDataManagerInputProtocol: AnyObject {
    /// Interactor -> RemoteDataManager
    var remoteRequestHandler: HomeFlightRemoteDataManagerOutputProtocol? { get set }
    
    func getDemoData(file: SegmentedTitles)
}

protocol HomeFlightRemoteDataManagerOutputProtocol: AnyObject {
    /// RemoteDataManager -> Interactor
    func pushFlightsData(flightData: [FlightStatusCollection])
    func catchResponse(withMessage: String)
}
