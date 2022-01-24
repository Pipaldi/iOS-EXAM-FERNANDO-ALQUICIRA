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
    @IBOutlet weak var first_subLabel: UILabel!
    @IBOutlet weak var second_subLabel: UILabel!
    @IBOutlet weak var third_subLabel: UILabel!
    @IBOutlet weak var fourth_subLabel: UILabel!
    @IBOutlet weak var fifth_subLabel: UILabel!
    @IBOutlet weak var sixth_subLabel: UILabel!
    
    // VIEWS
    @IBOutlet weak var first_view: UIView!
    @IBOutlet weak var second_view: UIView!
    @IBOutlet weak var third_view: UIView!
    @IBOutlet weak var fourth_view: UIView!
    @IBOutlet weak var fifth_view: UIView!
    @IBOutlet weak var sixth_view: UIView!
    
    // CHART VIEW
    @IBOutlet weak var pieView: PieChartView!
    
    var views_array = [UIView]()
    
    
}
