//
//  SettingsScreenDelegate.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 21/09/21.
//

import UIKit

protocol SettingsScreenDelegate: AnyObject {
    func didTappedUpdateName()
	func didTappedLogout(_ sender: UIButton)
}
