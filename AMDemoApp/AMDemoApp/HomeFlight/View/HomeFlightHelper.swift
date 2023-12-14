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
        
        presenter?.loadingView(file: .flightNumber)
    }
    
    private func loadSegmentedConfig(){
        let segments = ["Flight Number", "Destination"]
        let config = AMSegmentedControlModel(segments: segments, segmentedControlStyle: .´default´)
        self.segmentedControl.segmentedControlDelegate = self
        self.segmentedControl.setData(config: config)
    }
    
    private func createFilterViews(with index: Int){
        let stack = createStackViewContainer(frame: CGRect(x: 0, y: 0, width: 0, height: 64))
        
        switch index {
        case 0:
            loadRemoteDataCodes(with: .flightNumber).forEach { view in
                stack.addArrangedSubview(view)
            }
            viewsToMainStack.append(stack)
            addBottomViews().forEach { view in
                viewsToMainStack.append(view)
            }
            
        case 1:
            loadRemoteDataCodes(with: .destination).forEach { view in
                stack.addArrangedSubview(view)
            }
            viewsToMainStack.append(stack)
            
            let mutableAttributedDate = NSMutableAttributedString(string: "Tuesday, Nov  21")
            mutableAttributedDate.colorForTextCustom("Tuesday, Nov  21", with: .amBlack, font: .titleFilterLabel)
            
            let flightViewDataDate = AMFilterViewData(title: "Date of departure", titleFlight: mutableAttributedDate, imageFilter: UIImage(named: "AMCalendar"))

            viewsToMainStack.append(createFilterView(data: flightViewDataDate, frame: CGRect(x: 0, y: 0, width: 215, height: 64)))

            addBottomViews().forEach { view in
                viewsToMainStack.append(view)
            }
        default:
            break
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
    
    func showDatePicker(){
        datePicker.datePickerMode = .date
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Aceptar", style: .plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelDatePicker))
        
        toolbar.setItems([doneButton, spaceButton, cancelButton], animated: false)
    }
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.string(from: datePicker.date)
        print(formatter.string(from: datePicker.date))
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    private func addBottomViews() -> [UIView] {
        var viewsToMainStack: [UIView] = []
        
        let buttonSearch = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 56))
        buttonSearch.setTitle("Search Flight", for: .normal)
        buttonSearch.titleLabel?.font = AMLabelStyles.titleFilterLabel.font
        buttonSearch.backgroundColor = .amBlack
        buttonSearch.addLayerWithColor(cornerRadius: 10, borderWidth: 2, withColor: .amBlack)
        buttonSearch.setTitleColor(.amWhite, for: .normal)
        buttonSearch.addTarget(self, action:#selector(pushView), for: .touchUpInside)
        
        viewsToMainStack.append(buttonSearch)
        
        let mutableAttributedDate = NSMutableAttributedString(string: "Cant find your flight number?")
        mutableAttributedDate.colorForTextCustom("Cant find your flight number?", with: .amBlack, font: AMLabelStyles.titleLabelInformation)
        mutableAttributedDate.colorForTextCustom("Try searching by destination", with: .amBlack, font: .titleButtonStep)
        
        let labelCantFind = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        labelCantFind.textAlignment = .center
        labelCantFind.text = "Can’t find your flight number?\nTry searching by destination"
        labelCantFind.numberOfLines = 2
        labelCantFind.font = labelCantFind.font.withSize(12)
        
        viewsToMainStack.append(labelCantFind)
        
        return viewsToMainStack
    }
    
    @objc func pushView(sender: UIButton){
        let search = SearchData(flightNumber: "55")
        self.navigationController?.pushViewController(SearchFlightRouter.createSearchFlightModule(with: search, file: .destination), animated: true)
    }
}

extension HomeFlight: AMSegmentedControlProtocol {
    func selectedSegmentDelegate(to index: Int) {
        cleanStack()
        createFilterViews(with: index)
    }
}

extension HomeFlight: HomeFlightViewProtocol {
    ///Simulate the return data response to load the filterViews
    func loadRemoteDataCodes(with step: SegmentedTitles) -> [UIView] {
        var views: [UIView] = []
        
        switch step {
        case .flightNumber:
            let mutableAttributedString = NSMutableAttributedString(string: "AM 500")
            mutableAttributedString.colorForTextCustom("AM", with: .amLightGray, font: .titleFilterLabel)
            mutableAttributedString.colorForTextCustom("500", with: .amBlack, font: .titleFilterLabel)
            
            let filterViewData = AMFilterViewData(title: "Flight number", titleFlight: mutableAttributedString)
            
            views.append(createFilterView(data: filterViewData, frame: CGRect(x: 0, y: 0, width: 130, height: 64)))
            
            let mutableAttributedDate = NSMutableAttributedString(string: "Tuesday, Nov  21")
            mutableAttributedDate.colorForTextCustom("Tuesday, Nov  21", with: .amBlack, font: .titleFilterLabel)
            
            let flightViewData = AMFilterViewData(title: "Date of departure", titleFlight: mutableAttributedDate, imageFilter: UIImage(named: "AMCalendar"))

            views.append(createFilterView(data: flightViewData, frame: CGRect(x: 0, y: 0, width: 215, height: 64)))
            
        case .destination:
            let mutableAttributedOrigin = NSMutableAttributedString(string: "México City MEX")
            mutableAttributedOrigin.colorForTextCustom("México City", with: .amBlack, font: .titleFilterLabel)
            mutableAttributedOrigin.colorForTextCustom("MEX", with: .amLightGray, font: .titleFilterLabel)
            
            let flightViewData = AMFilterViewData(title: "Origin", titleFlight: mutableAttributedOrigin)
            
            views.append(createFilterView(data: flightViewData, frame: CGRect(x: 0, y: 0, width: 130, height: 64)))
            
            let mutableAttributedDestination = NSMutableAttributedString(string: "Cancún CUN")
            mutableAttributedDestination.colorForTextCustom("Cancún", with: .amBlack, font: .titleFilterLabel)
            mutableAttributedDestination.colorForTextCustom("CUN", with: .amLightGray, font: .titleFilterLabel)

            let flightViewDataDestination = AMFilterViewData(title: "Destination", titleFlight: mutableAttributedDestination)

            views.append(createFilterView(data: flightViewDataDestination, frame: CGRect(x: 0, y: 0, width: 130, height: 64)))
        }
        
        return views
    }
}
