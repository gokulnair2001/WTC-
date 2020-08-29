//
//  GraphViewController.swift
//  WTC!
//
//  Created by Gokul Nair on 25/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit
import Charts

class GraphViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet var segmentControl: UISegmentedControl!
    
    var barChart = BarChartView()
    var pieChart = PieChartView()
    let haptic = haptickFeedback()
    
    var modelC: infoC?
    var modelF: infoF?
    var modelP: infoP?
    var modelW: infoW?
    var modelE: info?
    var modelS: infoS?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barGraph()
        barChart.delegate = self
        segmentControl.backgroundColor = .green
    }
    
    // Code to dismiss ViewController by touching outside
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self.dismiss(animated: true, completion: nil)
        let touch = touches.first
        if touch?.view != self.barChart && touch?.view != self.pieChart
        { self.dismiss(animated: true, completion: nil) }
    }
    
    
    
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            pieChart.removeFromSuperview()
            barGraph()
            haptic.haptiFeedback2()
        }
        else if sender.selectedSegmentIndex == 1 {
            barChart.removeFromSuperview()
            pieGraph()
            haptic.haptiFeedback2()
        }
        
    }
}

//MARK:- Segemnt Control Codes

extension GraphViewController {
    
    
    func barGraph() {
        
        barChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        
        barChart.center = view.center
        view.addSubview(barChart)
        
        barChart.drawGridBackgroundEnabled = false
        barChart.highlightFullBarEnabled = true
        barChart.fitBars = true
        
        let set = BarChartDataSet(entries: [BarChartDataEntry(x: 1, y: 1),BarChartDataEntry(x: 2, y: 2),BarChartDataEntry(x: 3, y: 3),BarChartDataEntry(x: 4, y: 4),BarChartDataEntry(x: 5, y: 5),BarChartDataEntry(x: 6, y: 6)])
        
        set.colors = ChartColorTemplates.material()
        
        
        let data = BarChartData(dataSet: set)
        barChart.data = data
        
        barChart.animate(xAxisDuration: 2.0)
        barChart.animate(yAxisDuration: 2.0)
    }
    
    func pieGraph() {
        pieChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        
        pieChart.center = view.center
        view.addSubview(pieChart)
        
        
        
        let set = PieChartDataSet(entries: [PieChartDataEntry(value: 1, data: 1),PieChartDataEntry(value: 2, data: 2),PieChartDataEntry(value: 3, data: 3),PieChartDataEntry(value: 4, data: 4),PieChartDataEntry(value: 5, data: 5),PieChartDataEntry(value: 6, data: 6)])
        
        set.colors = ChartColorTemplates.material()
        pieChart.holeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7370772688)
        pieChart.drawHoleEnabled = true
        
        
        let data = PieChartData(dataSet: set)
        pieChart.data = data
        
        pieChart.animate(yAxisDuration: 1.0)
        pieChart.animate(xAxisDuration: 1.0)
        
    }
}

