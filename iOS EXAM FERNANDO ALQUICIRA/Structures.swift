//
//  Structures.swift
//  iOS EXAM FERNANDO ALQUICIRA
//
//  Created by Luis Fernando AG on 1/21/22.
//

import Foundation

struct Questions : Codable {
    
    let total : Int
    let text : String
    let chartData : [ChartData]
    
    struct ChartData : Codable {
        let text : String
        let percetnage : Int
    }
}

struct Result : Codable{
    
    let colors : [String]
    let questions: [Questions]
}
