//
//  Usuario.swift
//  iOS EXAM FERNANDO ALQUICIRA
//
//  Created by Luis Fernando AG on 1/6/22.
//

import Foundation
import UIKit

class Usuario {
    var nombre : String!
    var foto : UIImage?
    
    init() {
        self.nombre = "John Doe"
        self.foto = UIImage(named: "")
    }
    
    init(nombre: String, foto: UIImage?) {
        self.nombre = nombre
        self.foto = foto
    }
    
    
}
