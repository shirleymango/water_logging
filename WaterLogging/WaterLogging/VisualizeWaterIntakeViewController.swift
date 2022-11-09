//
//  VisualizeWaterIntakeViewController.swift
//  WaterLogging
//
//

import UIKit
import Charts

class VisualizeWaterIntakeViewController: UIViewController {

    private let trackingLabel = UILabel()
    private let barChart = BarChartView()
    var image = UIImage()
    var waterIntake = 0;
    var waterGoal = 0;
    
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
        updateChart()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
    }
    
    
    // Set up
    private func setUp() {
        setUpImage()
        setUpLabel()
        setUpChart()
    }
    
    // Set up congrats image
    private func setUpImage() {
        image = UIImage(named: "congrats.jpeg")!
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: self.view.center.x-52.5, y: self.view.center.y+225, width: 105, height: 115)
        view.addSubview(imageView)
//        imageView.isHidden = true
    }
    
    // Set up label
    private func setUpLabel() {
        updateLabel()
        trackingLabel.textColor = .label
        view.backgroundColor = .systemBackground
        setUpLabelConstraints()
    }
    
    private func setUpLabelConstraints() {
        trackingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(trackingLabel)
        
        // Label constraints
        
        let trackingLabelConstraints = [trackingLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                    trackingLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -250),
                                    trackingLabel.topAnchor.constraint(greaterThanOrEqualTo: self.view.topAnchor),
                                    trackingLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor),
                                    trackingLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.view.trailingAnchor)]
        
        NSLayoutConstraint.activate(trackingLabelConstraints)
        
    }
    
    // Set up chart
    private func setUpChart() {
        // Configure chart
        barChart.frame = CGRect(x: 0, y: 0, width: view.frame.size.width/2, height: view.frame.size.width)
        
        // Configure axis
        barChart.xAxis.enabled = false
        barChart.rightAxis.enabled = false
        
        // Supply data
        updateChart()
        view.addSubview(barChart)
        barChart.center = view.center
    }
    
    // Update Label
    private func updateLabel() {
        updateValues()
        trackingLabel.text = String(waterIntake) + " oz of " + String(waterGoal) + " oz goal consumed today"
    }
    
    // Update Chart
    private func updateChart() {
        updateValues()
        var entries = [BarChartDataEntry(x: 0, yValues: [Double(waterIntake), Double(waterGoal-waterIntake)])]
        if (waterIntake >= waterGoal) {
            entries = [BarChartDataEntry(x: 0, yValues: [Double(waterIntake), Double(0)])]
        }
        let set = BarChartDataSet(entries: entries, label: "")
        set.colors = [NSUIColor(ciColor: CIColor(color: UIColor(red: 30/255.0, green: 159/255.0, blue: 249/255.0, alpha: 1))), NSUIColor(ciColor: CIColor(color: UIColor.darkGray))]
        let data = BarChartData(dataSet: set)
        barChart.data = data
    }
    
    private func updateValues() {
        waterIntake = self.defaults.integer(forKey: "waterIntake")
        waterGoal = self.defaults.integer(forKey: "waterGoal")
    }
}

