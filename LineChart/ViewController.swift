//
//  ViewController.swift
//  LineChart
//
//  Created by Pankti Patel on 24/07/15.
//  Copyright (c) 2015 Pankti Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var chartView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        chartView.descriptionText = ""
        chartView.noDataTextDescription = "You need to provide data for the chart."
        chartView.xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.Bottom
        chartView.rightAxis.enabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView._maxVisibleValueCount = 12
        chartView.xAxis.spaceBetweenLabels = 1
        chartView.leftAxis.labelCount = 6
        chartView.legend.wordWrapEnabled = true
        
        setData()
    }
    
    func setData(){
        
        var xVals:[String] = ["J","F","M","A","M","J","J","A","S","O","N","D"]
        var legendTitles = ["Intellectual","Performance","self-Management","Interpersonal","Personal Competences"]
        
        var colors:[UIColor] = [UIColor.magentaColor(),UIColor.orangeColor(),UIColor.cyanColor(),UIColor.greenColor(),UIColor.redColor(),UIColor.blackColor()]
        
        
        var dataSets = [ChartDataSet]()
        
        for z in 0..<5
        {
            var values = Array<ChartDataEntry>()
            
            for i in 0..<xVals.count
            {
                var val:Double = Double((arc4random_uniform(UInt32(7))))
                values.append(ChartDataEntry(value: val, xIndex: i))
            }
            
            var d:LineChartDataSet = LineChartDataSet(yVals: values, label: "\(legendTitles[z])")

            d.lineWidth = 2;

            var color:UIColor = colors[z % colors.count].colorWithAlphaComponent(0.5)
            d.setColor(color)
            d.drawCirclesEnabled = false
            dataSets.append(d)
            
        }
        
        var data:LineChartData = LineChartData(xVals: xVals, dataSets: dataSets)
        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 7))
        data.setDrawValues(false)
        chartView.data = data;


        chartView.animate(xAxisDuration: 1.5)
//        chartView.animate(xAxisDuration: 1.5, yAxisDuration: 1.5)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

