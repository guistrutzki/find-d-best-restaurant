//
//  UIViewController+ext.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 25/08/21.
//

import UIKit

extension UIViewController {
    
    typealias AlertAction = (UIAlertAction) -> Void
    
    func showMessage(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: K.ok, style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showMessageWithAction(title: String = "", message: String, actionTitle: String = K.ok, action: @escaping AlertAction) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: actionTitle, style: .default, handler: action))
        alertController.view.tintColor = .systemBlue
        self.present(alertController, animated: true, completion: nil)
    }
}
