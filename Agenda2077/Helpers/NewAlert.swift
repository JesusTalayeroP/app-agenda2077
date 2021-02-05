//
//  NewAlert.swift
//  Agenda2077
//
//  Created by alumnos on 04/02/2021.
//  Copyright © 2021 cev. All rights reserved.
//

import Foundation
import UIKit

// Al final no he conseguido implementar esto
class Alert {
    static func Alert(title: String, message: String){
        
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

    }
}

