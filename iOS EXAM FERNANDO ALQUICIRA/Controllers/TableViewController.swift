//
//  ViewController.swift
//  iOS EXAM FERNANDO ALQUICIRA
//
//  Created by Luis Fernando AG on 1/6/22.
//

import UIKit

class TableViewController: UITableViewController{
    
    
    var usuario : Usuario!
    var alerta = UIAlertController()
    
    @IBOutlet weak var userTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        usuario = Usuario()
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Switch statement to return custom cells
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "nombreDeUsuario") as! UsernameCell
            cell.usernameTF.delegate = self
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "selfieDeUsuario") as! SelfieCell
            
            cell.buttonTouched = {
                // If profile picture is nil present alert with TAKE PICTURE button
                if self.usuario.foto == nil {
                    self.alerta = UIAlertController(title: "FOTO DE PERFIL", message: "¿Qué deseas hacer?", preferredStyle: .alert)
                    self.present(self.alerta, animated: true, completion: nil)
                    
                    self.alerta.addAction(UIAlertAction(title: "Tomar foto", style: .default, handler: { UIAlertAction in
                        let picker = UIImagePickerController()
                        picker.sourceType = .camera
                        picker.allowsEditing = true
                        picker.delegate = self
                        self.present(picker, animated: false, completion: nil)
                    }))
                    
                }else{
                    // If profile picture is available, present alert with TAKE PICTURE button and SEE PHOTO button
                    self.alerta = UIAlertController(title: "FOTO DE PERFIL", message: "¿Qué deseas hacer?", preferredStyle: .alert)
                    self.present(self.alerta, animated: true, completion: nil)
                    
                    self.alerta.addAction(UIAlertAction(title: "Tomar foto", style: .default, handler: { UIAlertAction in
                        let picker = UIImagePickerController()
                        picker.sourceType = .camera
                        picker.allowsEditing = true
                        picker.delegate = self
                        self.present(picker, animated: false, completion: nil)
                    }))
                    
                    self.alerta.addAction(UIAlertAction(title: "Ver Foto", style: .default, handler: { UIAlertAction in
                        self.performSegue(withIdentifier: "fotoSegue", sender: self)
                    }))
                }
                
            }
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "graficas") as! GraphicsCell
            cell.delegate = self
            return cell
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "graficasSegue" {
            let graficasVC = segue.destination as! GraphicsViewController
            graficasVC.usuario = usuario
        }
        
        if segue.identifier == "fotoSegue"{
            let profileVC = segue.destination as! ProfileViewController
            profileVC.usuario = usuario
        }
        
        
    }
    
}

extension TableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate, CustomTextFieldDelegate, graficasCellDelegate{
    
    // Delegate to move to GrpahicsController when touched
    func graficasCellDelegate() {
        self.performSegue(withIdentifier: "graficasSegue", sender: self)
    }
    // Set image to User
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        usuario.foto = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    // User TEXTFIELD listener
    func getTextFieldString(nombre: String) {
        usuario.nombre = nombre
    }
    
    // Function that handles only letters and white spaces for the text field
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
            if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
                return false
            }
        }
        catch {
            print("ERROR")
        }
        return true
    }
    
    
}
