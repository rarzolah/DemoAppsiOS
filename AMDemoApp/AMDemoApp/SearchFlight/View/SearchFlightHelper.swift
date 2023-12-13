//
//  SearchFlightHelper.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 13/12/23.
//

import UIKit

extension SearchFlight{
    public func setupUI(){
        view.backgroundColor = .amWhite
    }
}

extension SearchFlight: SearchFlightViewProtocol {
    func loadRemoteDataCodes(with step: SegmentedTitles) -> [UIView] {
        var views: [UIView] = []
        
        return views
    }
}
