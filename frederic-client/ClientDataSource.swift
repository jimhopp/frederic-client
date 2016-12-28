//
//  ClientDataSource.swift
//  frederic-client
//
//  Created by Jim Hopp on 12/21/16.
//  Copyright © 2016 Jim Hopp. All rights reserved.
//

import UIKit

class ClientDataSource: NSObject, UITableViewDataSource {
    
    struct Client: Comparable {
        
        var firstName = ""
        var lastName = ""
        var sortableName : String {
            return self.lastName + ", " + self.firstName
        }
        
        init(firstName: String, lastName: String) {
            self.firstName = firstName
            self.lastName = lastName
        }
        
        static func ==(lhs: Client, rhs: Client) -> Bool {
            return lhs.lastName == rhs.lastName && lhs.firstName == rhs.firstName
        }
        
        static func < (lhs: Client, rhs: Client) -> Bool {
            if lhs.lastName < rhs.lastName {
                return true
            } else if lhs.lastName == rhs.lastName && lhs.firstName < rhs.firstName {
                return true
            }
            return false
        }
    }

    static var singleton: ClientDataSource? = nil
    
    let cellID = "client"
    
    let clients = [Client(firstName: "frederic", lastName: "ozanam"), Client(firstName: "rosalie", lastName: "rendu"), Client(firstName: "theresa", lastName: "gonzalez"), Client(firstName: "thomas", lastName: "wolf"), Client(firstName: "giggs", lastName: "smith"), Client(firstName: "frodo", lastName: "baggins"), Client(firstName: "oscar", lastName: "ellis"), Client(firstName: "sparky", lastName: "seaman"), Client(firstName: "duncan", lastName: "lawrence") ].sorted()
    

    
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
        cell.textLabel!.text = clients[indexPath.row].sortableName
        
        return cell
    }

}
