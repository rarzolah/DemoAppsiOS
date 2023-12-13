//
//  AMFilterViewController.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 12/12/23.
//

import UIKit

public class AMFilterViewController: UIView{
    
    @IBOutlet weak var contentView: UIView!{
        didSet{
            contentView.addLayerWithColor(cornerRadius: 10, borderWidth: 2, withColor: .amBlack)
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
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
        titleLabel = data.title
        titleFlight.attributedText = data.titleFlight
        if let image = data.imageFilter{
            imageFilter.image = image
        }else{
            imageFilter.isHidden = true
        }
    }
}
