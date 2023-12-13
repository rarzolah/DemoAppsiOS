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
    @IBOutlet weak var stackViewForm: UIStackView!
    
    @IBOutlet weak var containerViewStack: UIView!
    
    var presenter: HomeFlightPresenterProtocol?
    var viewsToMainStack: [UIView] = []
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
