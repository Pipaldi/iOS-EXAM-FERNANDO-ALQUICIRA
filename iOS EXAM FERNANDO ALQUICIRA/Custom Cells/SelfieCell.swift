//
//  SelfieCell.swift
//  iOS EXAM FERNANDO ALQUICIRA
//
//  Created by Luis Fernando AG on 1/6/22.
//

import Foundation
import UIKit

class SelfieCell: UITableViewCell{
    
    var buttonTouched: (()->Void)?
    
    //Closure para crear de alerta
    
    @IBAction func tomarSelfie(_ sender: Any) {
        
        self.buttonTouched?()
        
    }
    
}


