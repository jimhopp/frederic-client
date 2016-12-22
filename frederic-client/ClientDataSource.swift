//
//  ClientDataSource.swift
//  frederic-client
//
//  Created by Jim Hopp on 12/21/16.
//  Copyright © 2016 Jim Hopp. All rights reserved.
//

import UIKit

class ClientDataSource: NSObject, UITableViewDataSource {

    static var singleton: ClientDataSource? = nil
    
    let cellID = "client"
    let clients = ["ozanam, frederic", "rendu, rosalie", "gonzalez, theresa", "wolf, thomas", "smith, giggs",
                   "baggins, frodo", "ellis, oscar", "seaman, sparky", "lawrence, duncan"].sorted()
    
    init(_ tableView: UITableView) {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    class func getClientDataSource(_ tableView: UITableView) -> ClientDataSource {
        if singleton == nil {
            singleton = ClientDataSource(tableView)
        }
        return singleton!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clients.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel!.text = clients[indexPath.row]
        
        return cell
    }

}
