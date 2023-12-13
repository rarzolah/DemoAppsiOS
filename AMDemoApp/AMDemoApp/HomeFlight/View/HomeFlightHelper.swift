//
//  HomeFlightHelper.swift
//  AMDemoApp
//
//  Created by Roberto Arzola on 13/12/23.
//

import UIKit

extension HomeFlight {
    public func setupUI(){
        view.backgroundColor = .amWhite
        loadSegmentedConfig()
        
        //Consume servicio
        presenter?.loadingView()
    }
    
    private func loadSegmentedConfig(){
        let segments = ["Flight Number", "Destination"]
        let config = AMSegmentedControlModel(segments: segments, segmentedControlStyle: .´default´)
        self.segmentedControl.segmentedControlDelegate = self
        self.segmentedControl.setData(config: config)
    }
    
    private func createFilterViews(with index: Int){
        switch index {
        case 0:
            let mutableAttributedString = NSMutableAttributedString(string: "AM 500")
            mutableAttributedString.colorForTextCustom("AM", with: .amLightGray, font: .titleFilterLabel)
            mutableAttributedString.colorForTextCustom("500", with: .amBlack, font: .titleFilterLabel)
            
            let filterViewData = AMFilterViewData(title: "Flight number", titleFlight: mutableAttributedString)
            
            let mutableAttributedString2 = NSMutableAttributedString(string: "Tuesday, Nov  21")
            mutableAttributedString2.colorForTextCustom("Tuesday, Nov  21", with: .amBlack, font: .titleFilterLabel)
            
            let flightViewData = AMFilterViewData(title: "Date of departure", titleFlight: mutableAttributedString2)
            
            let stack = createStackViewContainer(frame: CGRect(x: 0, y: 0, width: 0, height: 64))
            
            stack.addArrangedSubview(createFilterView(data: filterViewData, frame: CGRect(x: 0, y: 0, width: 130, height: stack.frame.height)))
            stack.addArrangedSubview(createFilterView(data: flightViewData, frame: CGRect(x: 0, y: 0, width: 215, height: stack.frame.height)))

            viewsToMainStack.append(stack)
        case 1:
            let stack = createStackViewContainer(frame: CGRect(x: 0, y: 0, width: 0, height: 64))
            
            let mutableAttributedString2 = NSMutableAttributedString(string: "Tuesday, Nov  21")
            mutableAttributedString2.colorForTextCustom("Tuesday, Nov  21", with: .amBlack, font: .titleFilterLabel)
            
            let flightViewData = AMFilterViewData(title: "Date of departure", titleFlight: mutableAttributedString2)

            stack.addArrangedSubview(createFilterView(data: flightViewData, frame: CGRect(x: 0, y: 0, width: 215, height: stack.frame.height)))
            
            viewsToMainStack.append(stack)
        default:
            break;
        }

        viewsToMainStack.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stackViewForm.addArrangedSubview($0)
            
            NSLayoutConstraint.activate([
                $0.heightAnchor.constraint(equalToConstant: $0.frame.height),
                $0.widthAnchor.constraint(equalToConstant: stackViewForm.frame.width)
            ])
        }
        self.view.layoutIfNeeded()
    }
    
    private func createStackViewContainer(frame: CGRect) -> UIStackView{
        let stack = UIStackView(frame: frame)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 14
        return stack
    }
    
    private func createFilterView(data: AMFilterViewData, frame: CGRect) -> AMFilterViewController{
        let view = AMFilterViewController(frame: frame)
        view.initConfig(data: data)
        return view
    }
    
    private func cleanStack(){
        stackViewForm.arrangedSubviews.forEach { view in
            view.isHidden = true
        }
    }
}

extension HomeFlight: AMSegmentedControlProtocol {
    func selectedSegmentDelegate(to index: Int) {
        cleanStack()
        createFilterViews(with: index)
    }
}

extension HomeFlight: HomeFlightViewProtocol {
    
}
