//
//  CustomTextFieldView.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 22/08/21.
//

import UIKit

final class CustomTextFieldView: UIView {
	
	enum TextFieldType {
		case name, email, password
	}
	
	// MARK: - UI Element
	var customTextField: UITextField = {
		let textField = UITextField(frame: .zero)
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.backgroundColor = .systemGray
		textField.layer.cornerRadius = 10
		textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		textField.leftViewMode = .always
		textField.textColor = .white
		return textField
	}()
	
	
	// MARK: - Initialize
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Function
	func configureTextFieldType(_ type: TextFieldType) {
		switch type {
			case .name:
				customTextField.placeholder = "Digite seu nome completo"
				customTextField.autocapitalizationType = .words
				customTextField.autocorrectionType = .no
				customTextField.keyboardType = .default
				
			case .email:
				customTextField.placeholder = "Digite seu email"
				customTextField.autocapitalizationType = .none
				customTextField.autocorrectionType = .no
				customTextField.keyboardType = .emailAddress
				
			case .password:
				customTextField.placeholder = "Digite sua senha"
				customTextField.autocapitalizationType = .none
				customTextField.autocorrectionType = .no
				customTextField.keyboardType = .default
				customTextField.isSecureTextEntry = true
		}
	}
	
}


// MARK: - Extension CodeView
extension CustomTextFieldView: CodeView {
	
	func buildViewHierarchy() {
		addSubview(customTextField)
	}
	
	func setupConstraints() {
		customTextField.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.left.equalToSuperview()
			make.trailing.equalToSuperview()
			make.bottom.equalToSuperview()
			make.height.equalTo(50)
		}
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = .none
	}
	
}
