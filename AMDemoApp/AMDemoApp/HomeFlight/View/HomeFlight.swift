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
    
    @IBOutlet weak var flightNumberLabel: AMFilterViewController!
    
    
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
        
        let mutableAttributedString = NSMutableAttributedString(string: "AM 500")
        mutableAttributedString.colorForTextCustom("AM", with: .amLightGray, font: .titleFilterLabel)
        mutableAttributedString.colorForTextCustom("500", with: .amBlack, font: .titleFilterLabel)
        
        let filterViewData = AMFilterViewData(title: UILabel.label(text: "Flight number", style: .titleFilter, textColor: .amBlack), titleFlight: mutableAttributedString)
        flightNumberLabel.initConfig(data: filterViewData)
        
        presenter?.loadingView()
    }
    
    func selectedSegmentDelegate(to index: Int) {
        print(index)
    }
}

extension HomeFlight: HomeFlightViewProtocol {
    
}
