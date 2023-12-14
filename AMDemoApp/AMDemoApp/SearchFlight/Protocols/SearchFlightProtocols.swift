//
//  SearchFlightProtocols.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 13/12/23.
//

import Foundation
import UIKit

protocol SearchFlightViewProtocol: AnyObject {
    /// Presenter -> View
    var presenter: SearchFlightPresenterProtocol? { get set }
    
    func loadRemoteDataCodes(with step: SegmentedTitles) -> [UIView]
}

protocol SearchFlightRouterProtocol: AnyObject {
    /// Presenter -> Router
    static func createSearchFlightModule(with searchData: SearchData, file: SegmentedTitles) -> UIViewController
}

protocol SearchFlightPresenterProtocol: AnyObject {
    /// View -> Presenter
    var view: SearchFlightViewProtocol? { get set }
    var interactor: SearchFlightInteractorInputProtocol? { get set }
    var router: SearchFlightRouterProtocol? { get set }
    var searchData: SearchData? { get set }
    
    func loadingView(file: SegmentedTitles)
}

protocol SearchFlightInteractorOutputProtocol: AnyObject {
    /// Interactor -> Presenter
    func catchResponse(withMessage: String)
}

protocol SearchFlightInteractorInputProtocol: AnyObject {
    /// Presenter -> Interactor
    var presenter: SearchFlightInteractorOutputProtocol? { get set }
    var remoteDatamanager: SearchFlightRemoteDataManagerInputProtocol? { get set }
    
    func getDemoData(file: SegmentedTitles)
}

protocol SearchFlightRemoteDataManagerInputProtocol: AnyObject {
    /// Interactor -> RemoteDataManager
    var remoteRequestHandler: SearchFlightRemoteDataManagerOutputProtocol? { get set }
    
    func getDemoData(file: SegmentedTitles)
}

protocol SearchFlightRemoteDataManagerOutputProtocol: AnyObject {
    /// RemoteDataManager -> Interactor
    func pushFlightsData(flightData: [FlightStatusCollection])
    func catchResponse(withMessage: String)
}
