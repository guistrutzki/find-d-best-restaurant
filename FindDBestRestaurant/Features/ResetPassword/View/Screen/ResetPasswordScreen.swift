//
//  ResetPasswordScreen.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 29/08/21.
//

import UIKit


final class ResetPasswordScreen: UIView {
	
	// MARK: - UI Element
	
	private var mainStackView: UIStackView = {
		let stack = UIStackView(frame: .zero)
		stack.axis = .vertical
		stack.distribution = .fill
		stack.alignment = .center
		stack.spacing = 35
		return stack
	}()
	
	private var messageLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.text = K.resetMessage
		label.font = UIFont.systemFont(ofSize: 20)
		label.textAlignment = .center
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()
	
	private lazy var emailTextField: FBRTextField = {
		let textField = FBRTextField(placeholder: K.typeYourEmail)
		textField.autocapitalizationType = .none
		textField.keyboardType = .emailAddress
		textField.delegate = self
		return textField
	}()
	
	private var sendButton: FBRButton = {
        let button = FBRButton(backgroundColor: .systemRed, title: K.send, titleColor: .white)
		return button
	}()
	
	
	// MARK: - Variable
	
	private weak var delegate: ResetPasswordScreenDelegate?
	
	
	// MARK: - Initialize
	init(_ delegate: ResetPasswordScreenDelegate) {
		self.delegate = delegate
		super.init(frame: .zero)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Function
	@objc
	func didTappedSendButton(_ sender: UIButton) {
		self.delegate?.didTappedSendButton()
	}
	
	func getEmail() -> String {
		return emailTextField.text ?? ""
	}
	
}


// MARK: - Extension UITextFieldDelegate

extension ResetPasswordScreen: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
}


// MARK: - Extension CodeView

extension ResetPasswordScreen: CodeView {
	
	func buildViewHierarchy() {
		addSubview(mainStackView)
		mainStackView.addArrangedSubview(messageLabel)
		mainStackView.addArrangedSubview(emailTextField)
		mainStackView.addArrangedSubview(sendButton)
	}
	
	func setupConstraints() {
		
		mainStackView.snp.makeConstraints { make in
			make.top.equalTo(safeAreaLayoutGuide).offset(20)
			make.left.equalToSuperview().offset(20)
			make.right.equalToSuperview().inset(20)
		}
		
		messageLabel.snp.makeConstraints { make in
			make.left.equalTo(mainStackView.snp.left).offset(30)
			make.right.equalTo(mainStackView.snp.right).inset(30)
		}
		
		emailTextField.snp.makeConstraints { make in
			make.left.equalTo(mainStackView.snp.left)
			make.right.equalTo(mainStackView.snp.right)
			make.height.equalTo(50)
		}
		
		sendButton.snp.makeConstraints { make in
			make.left.equalTo(mainStackView.snp.left)
			make.right.equalTo(mainStackView.snp.right)
			make.height.equalTo(50)
		}
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = .clear
		sendButton.addTarget(self, action: #selector(didTappedSendButton(_:)), for: .touchUpInside)
	}
	
}
