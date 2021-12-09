//
//  SettingsVC.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 21/09/21.
//

import UIKit

class SettingsVC: UIViewController {
    
    private lazy var settingsScreen: SettingsScreen = {
        return SettingsScreen(self)
    }()
    
    override func loadView() {
        self.view = settingsScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateHeaderContent(data: nil)
    }
    
    func updateHeaderContent(data: SessionResponse?) {
        guard let data = data ?? SessionDataUserDefaults.getData() else { return }
        self.settingsScreen.updateView(with: data.user)
    }
}

extension SettingsVC: SettingsScreenDelegate {
    func didTappedUpdateName() {
        let modalVC = UpdateNameVC()
        modalVC.delegate = self
        self.present(modalVC, animated: true, completion: nil)
    }
    
    func didTappedUpdateEmail() {
        let modalVC = UpdateEmailVC()
        modalVC.delegate = self
        self.present(modalVC, animated: true, completion: nil)
    }
    
    func didTappedUpdatePassword() {
        let modalVC = UpdatePasswordVC()
        self.present(modalVC, animated: true, completion: nil)
    }
	
	func didTappedLogout(_ sender: UIButton) {
        SessionDataUserDefaults.clearData()
		let initialVC = InitialVC()
		let navController = UINavigationController(rootViewController: initialVC)
		UIApplication.shared.windows.first?.rootViewController = navController
		UIApplication.shared.windows.first?.makeKeyAndVisible()
	}
}

extension SettingsVC: UpdateNameDelegate {}
extension SettingsVC: UpdateEmailDelegate {}
