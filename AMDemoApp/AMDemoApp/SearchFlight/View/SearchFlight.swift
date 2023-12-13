//
//  SearchFlight.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 13/12/23.
//

import UIKit

class SearchFlight: UIViewController{
 
    var presenter: SearchFlightPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
