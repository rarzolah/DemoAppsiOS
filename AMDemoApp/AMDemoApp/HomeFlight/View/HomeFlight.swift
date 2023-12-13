//
//  HomeFlight.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 11/12/23.
//

import UIKit

class HomeFlight: UIViewController{
    @IBOutlet weak var labelTitle: UILabel!{
        didSet{
            labelTitle.font = AMLabelStyles.title.font
        }
    }
    @IBOutlet weak var labelSubTitle: UILabel!{
        didSet{
            labelSubTitle.font = AMLabelStyles.subTitle.font
        }
    }
    @IBOutlet weak var segmentedControl: AMSegmentedControl!
    
    
    var presenter: HomeFlightPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension HomeFlight: AMSegmentedControlProtocol {
    public func setupUI(){
        view.backgroundColor = .amWhite
        
        let segments =  ["Flight Number", "Destination"]
        let config = AMSegmentedControlModel(segments: segments, segmentedControlStyle: .´default´)
        self.segmentedControl.segmentedControlDelegate = self
        self.segmentedControl.setData(config: config)
        
        presenter?.loadingView()
    }
    
    func selectedSegmentDelegate(to index: Int) {
        print(index)
    }
}

extension HomeFlight: HomeFlightViewProtocol {
    
}
