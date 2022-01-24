//
//  ChartsCell.swift
//  iOS EXAM FERNANDO ALQUICIRA
//
//  Created by Luis Fernando AG on 1/21/22.
//

import Foundation
import UIKit
import Charts



class ChartsCell: UITableViewCell {
    
    
    
    // Connect UI Outlets
    
    // LABELS
    @IBOutlet weak var titleChartLabel: UILabel!
    
    // CHART VIEW
    @IBOutlet weak var pieView: PieChartView!
    
    var views_array = [UIView]()
    
    
}
