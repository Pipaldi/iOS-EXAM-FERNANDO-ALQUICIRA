//
//  ProfileViewController.swift
//  iOS EXAM FERNANDO ALQUICIRA
//
//  Created by Luis Fernando AG on 1/6/22.
//

import Foundation
import UIKit
import Firebase

class ProfileViewController: UIViewController {
        
    @IBOutlet weak var fotoDePerfil: UIImageView!
    var usuario = Usuario()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Pass data between controllers
        fotoDePerfil.image = usuario.foto
        print(usuario.nombre!)
    }
    
    @IBAction func cerrarControl(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
