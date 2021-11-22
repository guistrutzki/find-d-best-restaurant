//
//  SettingsVC.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 21/09/21.
//

import UIKit

class SettingsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private lazy var settingsScreen: SettingsScreen = {
        return SettingsScreen(self)
    }()
    
    override func loadView() {
        self.view = settingsScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension SettingsVC: SettingsScreenDelegate {
    func didTappedUpdateName() {
        let modalVC = UpdateNameVC()
        self.present(modalVC, animated: true, completion: nil)
    }
    
    func chooseImage(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let action = UIAlertController(title: "Photo Source", message: "Escolha sua imagem", preferredStyle: .actionSheet)
        action.addAction(UIAlertAction(title: "Câmera", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        action.addAction(UIAlertAction(title: "Galeria", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        action.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
    
        self.present(action, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imageView = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        settingsScreen.avatarImageView.image = imageView
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
	func didTappedLogout(_ sender: UIButton) {
		TokenUserDefaults.deleteToken()
		let initialVC = InitialVC()
		let navController = UINavigationController(rootViewController: initialVC)
		UIApplication.shared.windows.first?.rootViewController = navController
		UIApplication.shared.windows.first?.makeKeyAndVisible()
	}
}
