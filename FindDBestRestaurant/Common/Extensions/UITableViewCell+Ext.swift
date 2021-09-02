//
//  UITableViewCell+Ext.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 29/08/21.
//

import UIKit

extension UITableViewCell {
    
    static func registerOn(_ tableView: UITableView) {
        let reuseIdentifier = String(describing: self.self)
        tableView.register(self.self, forCellReuseIdentifier: reuseIdentifier)
    }
}
