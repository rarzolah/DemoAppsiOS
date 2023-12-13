//
//  AMSegmentedControl.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 12/12/23.
//

import UIKit

/// Delegate containing a function to receive the selected index in the AMSegmentedControl
public protocol AMSegmentedControlProtocol: AnyObject {
    func selectedSegmentDelegate(to index: Int)
}
/// New segmentedControl
///
/// You can create a AMSegmentedControl using the
/// func setData(config: AMSegmentedControlModel)
///
/// ```swift
/// let segmentControl = AMSegmentedControl()
/// let segments =  ["First", "Second", "Thrid", "Another", "Last"]
/// let config = AMSegmentedControlModel(segments: segments,
///                                             segmentedControlStyle: .´default´)
/// segmentControl.setData(config: config)
/// ```
public class AMSegmentedControl: UIControl {
    //MARK: - UI
    private var buttons = [UIButton]()
    private var separators = [UIView]()
    private var selectorView: UIView!
    private var titleLabel: UILabel!
    
    //MARK: - Logic Variables
    public weak var segmentedControlDelegate: AMSegmentedControlProtocol?
    private var selectedSegmentIndex = 0{
        didSet {
            updateSegmentedControl()
        }
    }
    private var configurationModel: AMSegmentedControlModel?{
        didSet {
            guard configurationModel != nil else {
                return
            }
            createSegmentedControl()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSegmentedControl()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSegmentedControl()
    }
    /// It is a setter to configure a AMSegmentedControl
     ///
     /// -Parameters:
     /// - config: Set a model with the configuration of the component.
     ///
    public func setData(config: AMSegmentedControlModel){
        self.configurationModel = config
        self.selectedSegmentIndex = config.selectedSegmentIndex
        segmentedControlDelegate?.selectedSegmentDelegate(to: config.selectedSegmentIndex)
    }

    private func createSegmentedControl() {
        guard let config = configurationModel else {
            return
        }
        backgroundColor = config.segmentedControlStyle.segmentBackgroundColor
        layer.cornerRadius = config.segmentedControlStyle.segmentedControlCornerRadius
        clipsToBounds = true
        buttons.removeAll()
        separators.removeAll()
        subviews.forEach { $0.removeFromSuperview() }
        for (index, segment) in config.segments.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(segment, for: .normal)
            button.titleLabel?.font = config.segmentedControlStyle.segmentTextFont
            button.setTitleColor(config.segmentedControlStyle.segmentTextColor, for: .normal)
            button.addTarget(self, action: #selector(segmentButtonTapped), for: .touchUpInside)
            button.titleLabel?.lineBreakMode = .byTruncatingTail
            button.tag = index
            button.adjustsImageWhenHighlighted = false
            buttons.append(button)
            addSubview(button)
            
            if let separatorColor = config.segmentedControlStyle.separatorColor, index < config.segments.count - 1{
                let separator = UIView()
                separator.backgroundColor = separatorColor
                separators.append(separator)
                addSubview(separator)
            }
        }

        selectorView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: frame.height))
        addSubview(selectorView)
        updateSegmentedControl()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        guard configurationModel != nil else {
            return
        }
        let buttonWidth = frame.width / CGFloat(buttons.count)
        let buttonHeight = frame.height

        for (index, button) in buttons.enumerated() {
            button.frame = CGRect(x: (CGFloat(index) * buttonWidth) + 1, y: 0, width: buttonWidth - 4, height: buttonHeight)
        }
        
        for (index, separator) in separators.enumerated() {
            separator.frame = CGRect(x: CGFloat(index + 1) * buttonWidth, y: buttonHeight / 4, width: 0.5, height: buttonHeight / 2)
        }
        
        updateSelectorFrame()
    }

    private func updateSegmentedControl() {
        if let config = configurationModel {
            settingsTitleLabel(config: config)
        }
        updateSelectorFrame()
    }

    private func updateSelectorFrame() {
        let buttonWidth = frame.width / CGFloat(buttons.count)
        let selectorX = CGFloat(selectedSegmentIndex) * buttonWidth
        UIView.animate(withDuration: 0.3) {
            if self.configurationModel?.segmentedControlStyle.separatorColor != nil{
                self.selectorView.frame = CGRect(x: selectorX + 2, y: 0, width: buttonWidth - 4, height: self.frame.height)
            } else {
                self.selectorView.frame = CGRect(x: selectorX, y: 0, width: buttonWidth, height: self.frame.height)
            }
            self.titleLabel.frame = self.selectorView.bounds
        }
    }
    
    private func settingsTitleLabel(config: AMSegmentedControlModel){
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.selectorView.frame.width, height: self.selectorView.frame.height))
        titleLabel.font = config.segmentedControlStyle.segmentTextFont
        titleLabel.textColor = config.segmentedControlStyle.selectorViewTextColor
        titleLabel.textAlignment = .center
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = config.segmentedControlStyle.selectorViewCornerRadius
        titleLabel.text = config.segments[selectedSegmentIndex]
        titleLabel.backgroundColor = config.segmentedControlStyle.selectorViewBackgroundColor
        selectorView.addSubview(titleLabel)
    }

    @objc private func segmentButtonTapped(_ sender: UIButton) {
        selectedSegmentIndex = sender.tag
        segmentedControlDelegate?.selectedSegmentDelegate(to: sender.tag)
    }
}
