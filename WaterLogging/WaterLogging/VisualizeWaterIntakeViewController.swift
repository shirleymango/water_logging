//
//  VisualizeWaterIntakeViewController.swift
//  WaterLogging
//
//

import UIKit
import Charts

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
        createChart()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        createChart()
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
        
//        setUpConstraints()
    }
    
    private func setUpConstraints() {
        trackingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(trackingLabel)
        
        // Label constraints
        
        let trackingLabelConstraints = [trackingLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                    trackingLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                                    trackingLabel.topAnchor.constraint(greaterThanOrEqualTo: self.view.topAnchor),
                                    trackingLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor),
                                    trackingLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.view.trailingAnchor)]
        
        NSLayoutConstraint.activate(trackingLabelConstraints)
        
//        let chartConstraints = [barChart.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//                                barChart.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)]
//
//        NSLayoutConstraint.activate(chartConstraints)
        
    }
    private func createChart() {
        // Create chart
        let barChart = BarChartView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width/2, height: view.frame.size.width))
        // Configure axis
        
        // Supply data
        let waterIntake = self.defaults.integer(forKey: "waterIntake")
        let waterGoal = self.defaults.integer(forKey: "waterGoal")
        let entries = [BarChartDataEntry(x: 0, yValues: [Double(waterIntake), Double(waterGoal-waterIntake)])]
        let set = BarChartDataSet(entries: entries, label: "Water Intake")
        set.colors = ChartColorTemplates.colorful()
        let data = BarChartData(dataSet: set)
        barChart.data = data
        view.addSubview(barChart)
        barChart.center = view.center
    }
}

