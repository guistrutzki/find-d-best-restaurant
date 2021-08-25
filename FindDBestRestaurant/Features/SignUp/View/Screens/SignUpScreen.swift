//
//  SignUpScreen.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 24/08/21.
//

import UIKit

final class SignUpScreen: UIView {
	
	// MARK: - UI Element
	private let stackView: UIStackView = {
		let stack = UIStackView(frame: .zero)
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .fill
		stack.spacing = 15
		return stack
	}()
	
	var nameTextField: CustomTextFieldView = {
		let textField = CustomTextFieldView(frame: .zero)
		textField.configureTextFieldType(.name)
		return textField
	}()
	
	var emailTextField: CustomTextFieldView = {
		let textField = CustomTextFieldView(frame: .zero)
		textField.configureTextFieldType(.email)
		return textField
	}()
	
	var passwordTextField: CustomTextFieldView = {
		let textField = CustomTextFieldView(frame: .zero)
		textField.configureTextFieldType(.password)
		return textField
	}()
	
	var signUpButton: CustomButtonView = {
		let button = CustomButtonView(frame: .zero)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.configureTitle(with: "Cadastrar")
		button.configureColor(with: .systemRed)
		return button
	}()
	
	
	// MARK: - Initialize
	override init(frame: CGRect = .zero) {
		super.init(frame: frame)
		
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


// MARK: - Extension CodeView
extension SignUpScreen: CodeView {
	
	func buildViewHierarchy() {
		addSubview(stackView)
		stackView.addArrangedSubview(nameTextField)
		stackView.addArrangedSubview(emailTextField)
		stackView.addArrangedSubview(passwordTextField)
		addSubview(signUpButton)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

			signUpButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
			signUpButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
			signUpButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
		])
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = .white
		signUpButton.translatesAutoresizingMaskIntoConstraints = false
	}
	
}
