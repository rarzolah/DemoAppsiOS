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
    //func reloadCollectionViewData()
    //func reloadCollectionViewSearchedData()
    //func catchResponse(withMessage: String?)
}

protocol SearchFlightRouterProtocol: AnyObject {
    /// Presenter -> Router
    static func createSearchFlightModule(with searchData: SearchData) -> UIViewController
    
    //func goToInformationMovie(informationMovieData: InformationMovie, view: SearchFlightViewProtocol)
}

protocol SearchFlightPresenterProtocol: AnyObject {
    /// View -> Presenter
    var view: SearchFlightViewProtocol? { get set }
    var interactor: SearchFlightInteractorInputProtocol? { get set }
    var router: SearchFlightRouterProtocol? { get set }
    var searchData: SearchData? { get set }
    
    //var selectedCategory: MovieCategory? { get set }
    
    func loadingView()
    //func getMovieCount() -> Int
    //func getMovie(indexPathRow: Int) -> Movie
    
    //func getSearchedMovieCount() -> Int
    //func getSearchedMovie(indexPathRow: Int) -> Movie
    
    //func getSearchedMovies(searchTerm: String)
    //func getInformationMovie(idMovie: Int)
}

protocol SearchFlightInteractorOutputProtocol: AnyObject {
    /// Interactor -> Presenter
    //func pushMoviesData(moviesData: [Movie])
    //func pushSearchedMoviesData(moviesData: [Movie])
    //func pushInformationMovieData(movieData: InformationMovie)
    
    func catchResponse(withMessage: String)
}

protocol SearchFlightInteractorInputProtocol: AnyObject {
    /// Presenter -> Interactor
    var presenter: SearchFlightInteractorOutputProtocol? { get set }
    var remoteDatamanager: SearchFlightRemoteDataManagerInputProtocol? { get set }
    
    func getDemoData()
    //func getMovies(categoryMovieType: MovieCategory)
    //func getSearchedMovies(searchTerm: String)
    //func getInformationMovie(idMovie: Int)
}

protocol SearchFlightRemoteDataManagerInputProtocol: AnyObject {
    /// Interactor -> RemoteDataManager
    var remoteRequestHandler: SearchFlightRemoteDataManagerOutputProtocol? { get set }
    
    func getDemoData()
    //func getMovies(categoryMovieType: MovieCategory)
    //func getSearchedMovies(searchTerm: String)
    //func getInformationMovie(idMovie: Int)
}

protocol SearchFlightRemoteDataManagerOutputProtocol: AnyObject {
    /// RemoteDataManager -> Interactor
    ///
    func pushFlightsData(flightData: [FlightStatusCollection])
    //func pushMoviesData(moviesData: [Movie])
    //func pushSearchedMoviesData(moviesData: [Movie])
    //func pushInformationMovieData(movieData: InformationMovie)
    
    func catchResponse(withMessage: String)
}
