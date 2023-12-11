//
//  HomeFlight.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 11/12/23.
//

import UIKit

class HomeFlight: UIViewController {

    var presenter: HomeFlightPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }


}

extension HomeFlight: HomeFlightViewProtocol {
    
}
