//
//  GastosFixosTableViewCell.swift
//  ConsumindoFinancasAPI
//
//  Created by Gabriel de Castro Chaves on 02/06/22.
//

import UIKit
import Charts


class HomeGastosFixosTableViewCell: UITableViewCell, HomeGastosFixosTableViewCellProtocol {


    //MARK: IBOulets
    @IBOutlet weak var valorTotalLabel: UILabel!
    @IBOutlet weak var pieView: PieChartView!
    
    func setupPieChart() {
        pieView.chartDescription.enabled = false
        pieView.drawHoleEnabled = false
        pieView.rotationAngle = 0
        pieView.rotationEnabled = false
        pieView.isUserInteractionEnabled = false
        pieView.legend.enabled = false
        
        var entries: [PieChartDataEntry] = []
        entries.append(PieChartDataEntry(value: 50.0, label: "TakeOut"))
        entries.append(PieChartDataEntry(value: 20.0, label: "HealthyFood"))
        entries.append(PieChartDataEntry(value: 30.0, label: "SoftDrink"))
        entries.append(PieChartDataEntry(value: 40.0, label: "Water"))
        entries.append(PieChartDataEntry(value: 80.0, label: "HomeMeals"))
        
        let dataSet = PieChartDataSet(entries: entries, label: "")
        
        let c1 = NSUIColor(hex: 0x3A015C)
        let c2 = NSUIColor(hex: 0x4F0147)
        let c3 = NSUIColor(hex: 0x35012C)
        let c4 = NSUIColor(hex: 0x290025)
        let c5 = NSUIColor(hex: 0x11001C)

        dataSet.colors = [c1, c2, c3, c4, c5]
        dataSet.drawValuesEnabled = false
        
        pieView.data = PieChartData(dataSet: dataSet)
    
    }
}

