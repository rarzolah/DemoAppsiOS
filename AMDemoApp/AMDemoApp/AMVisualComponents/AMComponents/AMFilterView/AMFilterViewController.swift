//
//  AMFilterViewController.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 12/12/23.
//

import UIKit

public class AMFilterViewController: UIView{
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.font = UIFont.systemRegular(size: 14)
        }
    }
    @IBOutlet weak var titleFlight: UILabel!
    @IBOutlet weak var imageFilter: UIImageView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }

    public func commonInit() {
        let nib = UINib(nibName: "AMFilterViewController", bundle: Bundle(for: Self.self))
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = self.bounds
        addSubview(contentView)
    }

    public func initConfig(data: AMFilterViewData) {
        titleLabel.text
    }
}
