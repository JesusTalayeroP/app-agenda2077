//
//  AgendaController.swift
//  Agenda2077
//
//  Created by user176680 on 2/1/21.
//  Copyright © 2021 cev. All rights reserved.
//

import UIKit
import Foundation

class AgendaController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    let request = Request.shared.getUsers()
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        request.response{(responseData) in
            guard let data = responseData.data
                else {return}
            
            do{
                self.users = try
                    JSONDecoder().decode([User].self, from: data)
                self.tableView.reloadData()
                //print("users == \(users)")
                
            }catch{
                print(data)
            }
        }
    }
    
    
    // Devuelve el número de elemtos del listado
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    // Devuelve la celda de la posición correspondiente
    
    // Devuelve la celda de la posición correspondiente
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! UserRow
        cell.userLabel.text = users[indexPath.row].username
        
        return cell
    }
        

}
