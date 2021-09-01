//
//  ResetPasswordVC.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 29/08/21.
//

import UIKit

class ResetPasswordVC: UIViewController {
	
	// MARK: - Element
    
	lazy var resetPasswordScreen: ResetPasswordScreen = {
		let screen = ResetPasswordScreen(self)
		return screen
	}()
	
	// MARK: - Life cycle
    
	override func loadView() {
		view = self.resetPasswordScreen
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureView()
	}
	
	
	// MARK: - Function
    
	private func configureView() {
		view.backgroundColor = Colors.gray800
		title = K.resetPassword
		navigationItem.largeTitleDisplayMode = .never
	}
	
	private func didSendResetPassword() {
		showMessage(title: K.sendEmail,
						message: K.sendEmailSuccessMessage)
	}
	
}


// MARK: - Extension ResetPassword

extension ResetPasswordVC: ResetPasswordScreenDelegate {
	
	func didTappedSendButton() {
		self.didSendResetPassword()
	}
	
}
