//
//  VisualizeWaterIntakeViewController.swift
//  WaterLogging
//
//

import UIKit

class VisualizeWaterIntakeViewController: UIViewController {

    private let trackingLabel = UILabel()
    let defaults = UserDefaults.standard
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        updateLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }
    
    // Update
    private func updateLabel() {
        let waterIntake = defaults.integer(forKey: "waterIntake")
        let waterGoal = defaults.integer(forKey: "waterGoal")
        trackingLabel.text = String(waterIntake) + " oz of " + String(waterGoal) + " oz goal consumed today"
    }
    
    // Set Up
    private func setUp() {
        updateLabel()
        trackingLabel.textColor = .label
        view.backgroundColor = .systemBackground
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        trackingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(trackingLabel)
        
        // Label constraints
        
        let trackingLabelConstraints = [trackingLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                    trackingLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                                    trackingLabel.topAnchor.constraint(greaterThanOrEqualTo: self.view.topAnchor),
                                    trackingLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor),
                                    trackingLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.view.trailingAnchor),
                                    trackingLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor)]
        
        NSLayoutConstraint.activate(trackingLabelConstraints)
        
    }
}

