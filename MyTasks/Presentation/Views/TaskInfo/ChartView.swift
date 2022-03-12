import Foundation
import Charts

class ChartView: UIView {
    
    lazy var chartView: LineChartView = {
        let chartView = LineChartView(frame: self.bounds)
        let leftAxis = chartView.leftAxis
        leftAxis.gridLineDashLengths = [5, 5]
        leftAxis.drawLimitLinesBehindDataEnabled = true

        chartView.rightAxis.enabled = false

        return chartView
    }()
    
    var color: UIColor
    
    init(color: UIColor) {
        self.color = color
//        chartView = LineChartView()
        super.init(frame: .zero)
        addSubview(chartView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(dataEntryes: [ChartDataEntry]) {
        let dataSet = LineChartDataSet(entries: dataEntryes)
        
        dataSet.drawIconsEnabled = false
        
        dataSet.drawFilledEnabled = false
        dataSet.drawCirclesEnabled = true
        dataSet.drawValuesEnabled = false
        dataSet.drawCircleHoleEnabled = false
        
        dataSet.circleHoleColor = color
        dataSet.circleColors = [color]
        dataSet.circleRadius = 4
        dataSet.circleHoleRadius = 22.16 / 2.0
        
        dataSet.lineWidth = 4
        
        dataSet.lineCapType = .round
        dataSet.setColors(color)
        dataSet.mode = .linear
        

        let data = LineChartData(dataSet: dataSet)
        chartView.data = data
        
        setUpAxis()
        setupChartView()
        chartView.moveViewToX(data.xMax)
    }
    
    
    func setupChartView() {
        chartView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        chartView.fitScreen()
//        chartView.setVisibleXRangeMaximum(10)
        chartView.legend.enabled = false
        chartView.drawBordersEnabled = true
        chartView.borderColor = .clear
        chartView.autoScaleMinMaxEnabled = true
    }
    
    private func setUpAxis() {
        setupXAxis()
        setupLeftAxis()
        setupRightAxis()
    }
    
    private func setupXAxis() {
        chartView.xAxis.drawAxisLineEnabled = true
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.enabled = true
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelTextColor = .white
    }
    
    private func setupLeftAxis() {
        chartView.leftAxis.drawAxisLineEnabled = true
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.leftAxis.enabled = true
//        chartView.leftAxis.gridColor = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.2, alpha: 1)
        chartView.leftAxis.axisLineColor = .white
        chartView.leftAxis.labelTextColor = .white
        chartView.leftAxis.axisMaximum = 100
    }
    
    private func setupRightAxis() {
        chartView.rightAxis.drawGridLinesEnabled = false
        chartView.rightAxis.axisLineColor = .clear
//        chartView.rightAxis.gridColor = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.2, alpha: 1)
        chartView.rightAxis.enabled = false
        chartView.rightAxis.labelTextColor = .white
        chartView.rightAxis.axisMaximum = 100
    }
    

    
}
