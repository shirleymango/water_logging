//
//  TrackWaterViewController.swift
//  WaterLogging
//
//

import UIKit

class TrackWaterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    private let addWaterButton = UIButton()
    private let updateGoalButton = UIButton()
    private let updateGoalDropdown = UIPickerView()
    var list = [Int]()
    
    let defaults = UserDefaults.standard
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setUp()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateGoalDropdown.delegate = self
        updateGoalDropdown.dataSource = self
        updateGoalDropdown.selectRow(63, inComponent: 0, animated: true)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func populateArray() {
        for i in 1 ... 200 {
        list.append(i)
        }
    }

    // Set Up
    
    private func setUp() {
        populateArray()
        let waterGoal = defaults.integer(forKey: "waterGoal")
        addWaterButton.setTitle("Add 8 oz Water", for: .normal)
        updateGoalButton.setTitle("Daily Goal: " + String(waterGoal), for: .normal)
        addWaterButton.addTarget(self, action: #selector(addWaterButtonPressed), for: .touchUpInside)
        updateGoalButton.addTarget(self, action: #selector(goalButtonPressed), for: .touchUpInside)
        
        view.backgroundColor = .systemBackground
        addWaterButton.backgroundColor = .black
        updateGoalButton.backgroundColor = .black
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        let container = UIView()
        addWaterButton.translatesAutoresizingMaskIntoConstraints = false
        updateGoalButton.translatesAutoresizingMaskIntoConstraints = false
        updateGoalDropdown.isHidden = true
        container.addSubview(addWaterButton)
        container.addSubview(updateGoalButton)
        container.addSubview(updateGoalDropdown)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(container)
        
        // Buttons constraints
        let addWaterButtonConstraints = [addWaterButton.topAnchor.constraint(equalTo: container.topAnchor),
                                         addWaterButton.leadingAnchor.constraint(equalTo: container.leadingAnchor),
                                         addWaterButton.trailingAnchor.constraint(equalTo: container.trailingAnchor),]
        
        NSLayoutConstraint.activate(addWaterButtonConstraints)
        
        let updateGoalButtonConstraints = [updateGoalButton.topAnchor.constraint(equalTo: addWaterButton.bottomAnchor, constant: 10),
                                           updateGoalButton.leadingAnchor.constraint(equalTo: container.leadingAnchor),
                                           updateGoalButton.trailingAnchor.constraint(equalTo: container.trailingAnchor)]
        
        NSLayoutConstraint.activate(updateGoalButtonConstraints)
        
        let updateGoalDropdownConstraints = [updateGoalDropdown.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                             updateGoalDropdown.leadingAnchor.constraint(equalTo: container.leadingAnchor),
                                             updateGoalDropdown.trailingAnchor.constraint(equalTo: container.trailingAnchor),
                                             updateGoalDropdown.bottomAnchor.constraint(equalTo: container.bottomAnchor)]
        

        NSLayoutConstraint.activate(updateGoalDropdownConstraints)
        
        // ContainerView constraints
        
        let containerConstraints = [container.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                    container.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                                    container.topAnchor.constraint(greaterThanOrEqualTo: self.view.topAnchor),
                                    container.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor),
                                    container.trailingAnchor.constraint(lessThanOrEqualTo: self.view.trailingAnchor),
                                    container.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor)]
        
        NSLayoutConstraint.activate(containerConstraints)
        
    }
    
    // Actions
    
    @objc private func addWaterButtonPressed() {
        print("Add water button pressed")
        var waterIntake = defaults.integer(forKey: "waterIntake")
        waterIntake += 8
        defaults.set(waterIntake, forKey: "waterIntake")
        print(waterIntake)
    }
    
    @objc private func goalButtonPressed() {
        print("Goal button pressed")
        updateGoalDropdown.isHidden = false
    }
    
    // Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return String(list[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateGoalDropdown.isHidden = true;
    }

}

