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
	
	private var backButton: UIButton = {
		 let button = UIButton()
		 button.setImage(UIImage(named: "arrow-left"), for: .normal)
		 button.tintColor = .white
		 return button
	}()
	
	private var titleLabel: UILabel = {
		 let label = UILabel()
		 label.textColor = .white
		 label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
		 label.text = K.resetPassword
		 return label
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
	
	@objc
	private func didTappedBackButton(_ button: UIButton) {
		self.delegate?.didTappedBackButton()
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
		addSubview(backButton)
		addSubview(titleLabel)
		addSubview(mainStackView)
		mainStackView.addArrangedSubview(messageLabel)
		mainStackView.addArrangedSubview(emailTextField)
		mainStackView.addArrangedSubview(sendButton)
	}
	
	func setupConstraints() {
		
		backButton.snp.makeConstraints { make in
			 make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
			 make.leading.equalToSuperview().offset(26)
			 make.height.equalTo(24)
		}
		
		titleLabel.snp.makeConstraints { make in
			 make.centerY.equalTo(backButton.snp.centerY)
			 make.centerX.equalToSuperview()
			 make.height.equalTo(24)
		}
		
		mainStackView.snp.makeConstraints { make in
			make.top.equalTo(titleLabel.snp.bottom).offset(40)
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
		self.backgroundColor = Colors.gray500
		
		let sendButtonAction = #selector(didTappedSendButton(_:))
		let backButtonAction = #selector(didTappedBackButton(_:))
		
		sendButton.addTarget(self, action: sendButtonAction, for: .touchUpInside)
		backButton.addTarget(self, action: backButtonAction, for: .touchUpInside)
	}
	
}
