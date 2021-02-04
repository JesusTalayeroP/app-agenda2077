//
//  NewAlert.swift
//  Agenda2077
//
//  Created by alumnos on 04/02/2021.
//  Copyright © 2021 cev. All rights reserved.
//

import Foundation
import UIKit

func Alert(title: String, message: String, buttonTitle: String){
    
    let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
    
    //self.present(alert, animated: true)
}
