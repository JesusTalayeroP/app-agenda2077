//
//  AgendaController.swift
//  Agenda2077
//
//  Created by user176680 on 2/1/21.
//  Copyright © 2021 cev. All rights reserved.
//

import UIKit

class AgendaController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var users: [User?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        var users = Service.shared.getUsers()
        
        reloadInputViews()
        
        
    }
    
    
    // Devuelve el número de elemtos del listado
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    // Devuelve la celda de la posición correspondiente
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! UserRow
        cell.userLabel.text = users[indexPath.row]?.name
                
        return cell
    }
        

}
