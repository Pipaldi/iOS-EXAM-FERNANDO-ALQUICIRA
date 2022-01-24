//
//  UsernameCell.swift
//  iOS EXAM FERNANDO ALQUICIRA
//
//  Created by Luis Fernando AG on 1/6/22.
//

import Foundation
import UIKit

protocol CustomTextFieldDelegate {
    func getTextFieldString(nombre: String)
}

class UsernameCell: UITableViewCell {
    
    var delegate : CustomTextFieldDelegate?
    
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBAction func nombreDeUsuarioTF(_ sender: Any) {
                
        delegate?.getTextFieldString(nombre: self.usernameTF.text!)
    }
    
    
}







