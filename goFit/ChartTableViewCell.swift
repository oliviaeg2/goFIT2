//
//  ChartTableViewCell.swift
//  goFit
//
//  Created by Denis Russu on 11/29/17.
//  Copyright © 2017 CS147. All rights reserved.
//

import UIKit
import PNChart

// Subclass of UITableViewCell that is used to create the chart that appears at 
// the top of the ChartTableViewController
class ChartTableViewCell: UITableViewCell {
    
    let weeklyData = [[4, 5, 8, 2, 5, 1, 9], [3, 6, 8, 3, 7, 1, 3], [4, 5, 8, 2, 5, 1, 9]] as [[CGFloat]]
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initializes the line chart
        var lineChart = PNLineChart(frame: CGRect(x: self.contentView.frame.origin.x, y: self.contentView.frame.origin.y + 10, width: self.frame.width, height: self.frame.height - 10))
        
        lineChart.xLabels = ["Sun","Mon","Tues","Wed","Thur","Fri","Sat"]
        lineChart.yLabelFormat = "%1.1f"
        lineChart.showLabel = true
        lineChart.backgroundColor = UIColor.clear
        lineChart.isShowCoordinateAxis = true
        
        // Add mock data and configure the data
        var data01Array: [CGFloat] = weeklyData[0]
        let data01: PNLineChartData = PNLineChartData()
        data01.color = UIColor.init(red: 72/255, green: 208/255, blue: 249/255, alpha: 0.5)
        data01.itemCount = UInt(data01Array.count)
        data01.getData = {(index: UInt) -> PNLineChartDataItem in
            let yValue = CGFloat(data01Array[Int(index)])
            return PNLineChartDataItem(y: yValue)
        }
        
        // Draw the chart
        lineChart.chartData = [data01]
        lineChart.stroke()
        
        let background = CAGradientLayer().lightBlueColor()
        background.frame = self.contentView.bounds
        self.contentView.layer.insertSublayer(background, at: 0)
        
        // Add the chart as a subview of the cell
        self.contentView.addSubview(lineChart)
    }
}
