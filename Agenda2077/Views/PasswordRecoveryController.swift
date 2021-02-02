//
//  PasswordRecoveryController.swift
//  Agenda2077
//
//  Created by user176680 on 2/1/21.
//  Copyright © 2021 cev. All rights reserved.
//

import UIKit

class PasswordRecoveryController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func RecoverPasswordButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)

    }
    
    @IBAction func LogInButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)

    }
}
