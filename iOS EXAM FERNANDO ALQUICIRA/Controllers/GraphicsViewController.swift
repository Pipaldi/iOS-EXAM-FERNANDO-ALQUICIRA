//
//  GraphicsViewController.swift
//  iOS EXAM FERNANDO ALQUICIRA
//
//  Created by Luis Fernando AG on 1/6/22.
//

import Foundation
import UIKit
import Charts
import Firebase
import FirebaseAuth
import FirebaseStorage


class GraphicsViewController: UITableViewController {
    
    @IBOutlet weak var uploadButton: UIButton!
    
    
    var usuario : Usuario = Usuario()
    var result : Result?
    var bgColor = "cfcecc"
    var alerta = UIAlertController()
    
    let colorRef = Database.database().reference().child("bgColor")
    let storageRef = Storage.storage().reference()
    
    
    override func viewDidLoad() {
        print(usuario.nombre!)
        
        makePOSTRequest()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        colorRef.observe(.value) { DataSnapshot in
            self.bgColor = DataSnapshot.value as! String
            print(self.bgColor)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let result = result {
            return result.questions.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "graficas") as! ChartsCell
        cell.backgroundColor = hexStringToUIColor(hex: bgColor)
        let pieView = cell.pieView!
        
        // Add title to each Cell
        cell.titleChartLabel.text = result?.questions[indexPath.row].text
        
        // Setup Chart VIew
        setupPieChart(pieView, indexPath: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
    
    // Function to make API Call
    func makePOSTRequest(){
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let jsonDecoder = JSONDecoder()
        
        guard let url = URL(string: "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld") else {
            fatalError()
        }
        let task = session.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                return
            }
            guard let data = data else {
                return
            }
            
            do {
                self.result = try jsonDecoder.decode(Result.self, from: data)
            }
            catch {
                print("ERROR: \(error)")
            }
            // Reload data when finishing decoding
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    @IBAction func uploadProfile(_ sender: Any) {
        // If profile picture is not avaiable present alert else upload profile to Firestore
        if usuario.foto == nil {
            alerta = UIAlertController(title: "CREAR PERFIL", message: "Aún no tienes foto de perfil", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: nil))
            self.present(alerta, animated: true, completion: nil)
        } else {
            storageRef.child("\(usuario.nombre ?? "noIMAGE").png").putData((usuario.foto?.pngData())!, metadata: nil) { _, error in
                guard error == nil else {
                    print("failed to upload")
                    return
                }
            }
        }
    }
    
    func setupPieChart(_ pieView: PieChartView, indexPath: IndexPath){
        
        var entries: [PieChartDataEntry] = Array()
        var chartColors = [UIColor]()
        
        pieView.drawHoleEnabled = true
        pieView.holeRadiusPercent = 0.85
        pieView.holeColor = .clear
        pieView.rotationAngle = 0
        pieView.isUserInteractionEnabled = false
        
        if let result = result {
            
            for color in result.colors {
                let color_to_pass = hexStringToUIColor(hex: color)
                chartColors.append(color_to_pass)
            }
            
            let data = result.questions[indexPath.row]
            
            for item in data.chartData {
                
                entries.append(PieChartDataEntry(value: Double(item.percetnage), label: "\(item.text) \(item.percetnage)%"))
            }
        }
        
        let dataSet = PieChartDataSet(entries: entries, label: nil)
        pieView.drawEntryLabelsEnabled = false
        dataSet.colors = chartColors
        dataSet.drawValuesEnabled = false
        pieView.data = PieChartData(dataSet: dataSet)
    }
    
    // Function to convert HEX values into UICOLOR
    func hexStringToUIColor (hex:String) -> UIColor {
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
}




