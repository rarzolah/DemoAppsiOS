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
    
    //func reloadCollectionViewData()
    //func reloadCollectionViewSearchedData()
    //func catchResponse(withMessage: String?)
}

protocol HomeFlightRouterProtocol: AnyObject {
    /// Presenter -> Router
    static func createHomeFlightModule() -> UIViewController
    
    //func goToInformationMovie(informationMovieData: InformationMovie, view: HomeFlightViewProtocol)
}

protocol HomeFlightPresenterProtocol: AnyObject {
    /// View -> Presenter
    var view: HomeFlightViewProtocol? { get set }
    var interactor: HomeFlightInteractorInputProtocol? { get set }
    var router: HomeFlightRouterProtocol? { get set }
    //var selectedCategory: MovieCategory? { get set }
    
    func loadingView()
    //func getMovieCount() -> Int
    //func getMovie(indexPathRow: Int) -> Movie
    
    //func getSearchedMovieCount() -> Int
    //func getSearchedMovie(indexPathRow: Int) -> Movie
    
    //func getSearchedMovies(searchTerm: String)
    //func getInformationMovie(idMovie: Int)
}

protocol HomeFlightInteractorOutputProtocol: AnyObject {
    /// Interactor -> Presenter
    //func pushMoviesData(moviesData: [Movie])
    //func pushSearchedMoviesData(moviesData: [Movie])
    //func pushInformationMovieData(movieData: InformationMovie)
    
    func catchResponse(withMessage: String)
}

protocol HomeFlightInteractorInputProtocol: AnyObject {
    /// Presenter -> Interactor
    var presenter: HomeFlightInteractorOutputProtocol? { get set }
    var remoteDatamanager: HomeFlightRemoteDataManagerInputProtocol? { get set }
    
    func getDemoData()
    //func getMovies(categoryMovieType: MovieCategory)
    //func getSearchedMovies(searchTerm: String)
    //func getInformationMovie(idMovie: Int)
}

protocol HomeFlightRemoteDataManagerInputProtocol: AnyObject {
    /// Interactor -> RemoteDataManager
    var remoteRequestHandler: HomeFlightRemoteDataManagerOutputProtocol? { get set }
    
    func getDemoData()
    //func getMovies(categoryMovieType: MovieCategory)
    //func getSearchedMovies(searchTerm: String)
    //func getInformationMovie(idMovie: Int)
}

protocol HomeFlightRemoteDataManagerOutputProtocol: AnyObject {
    /// RemoteDataManager -> Interactor
    ///
    func pushFlightsData(flightData: [FlightStatusCollection])
    //func pushMoviesData(moviesData: [Movie])
    //func pushSearchedMoviesData(moviesData: [Movie])
    //func pushInformationMovieData(movieData: InformationMovie)
    
    func catchResponse(withMessage: String)
}
