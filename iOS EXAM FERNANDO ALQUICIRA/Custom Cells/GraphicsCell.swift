//
//  graphicsCell.swift
//  iOS EXAM FERNANDO ALQUICIRA
//
//  Created by Luis Fernando AG on 1/6/22.
//

import Foundation
import UIKit

protocol graficasCellDelegate {
    func graficasCellDelegate()
}

class GraphicsCell: UITableViewCell {
    var delegate: graficasCellDelegate?
    @IBOutlet weak var graficasTV: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(GraphicsCell.viewTapped(_:)))
        graficasTV.isUserInteractionEnabled = true
        tapGesture.delegate = self
        graficasTV.addGestureRecognizer(tapGesture)
        
       
        //addGestureRecognizer(tapGesture)
    }
    
    override func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer){
        delegate?.graficasCellDelegate()
    }
    
   
    
}
