//
//  SignUpScreen.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 24/08/21.
//

import UIKit

final class SignUpScreen: UIView {
    
    // MARK: - UI Element
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 15
        return stack
    }()
    
    private lazy var nameTextField: FBRTextField = {
        let textField = FBRTextField(placeholder: K.typeYourFullName)
        textField.autocapitalizationType = .words
        textField.keyboardType = .default
        textField.delegate = self
        textField.tag = 1
        return textField
    }()
    
    private lazy var emailTextField: FBRTextField = {
        let textField = FBRTextField(placeholder: K.typeYourEmail)
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.delegate = self
        textField.tag = 2
        return textField
    }()
    
    private lazy var passwordTextField: FBRTextField = {
        let textField = FBRTextField(placeholder: K.typeYourPassword)
        textField.autocapitalizationType = .none
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.delegate = self
        textField.tag = 3
        return textField
    }()
    
    private lazy var signUpButton: FBRButton = {
        let button = FBRButton(backgroundColor: .systemRed, title: K.signUp, titleColor: .white)
        return button
    }()
    
    // MARK: - Private Properties
    
    weak var delegate: SignUpScreenDelegate!
    
    // MARK: - Inits
    
    init(_ delegate: SignUpScreenDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    
    func getUserName() -> String {
        return nameTextField.text ?? ""
    }
    
    func getUserEmail() -> String {
        return emailTextField.text ?? ""
    }
    
    func getUserPassword() -> String {
        return passwordTextField.text ?? ""
    }
    
    // MARK: - Private Functions
    
    @objc
    private func didTappedSignUpButton(_ sender: Any) {
        delegate.didTappedSignUpButton()
    }
}

// MARK: - Extension UITextFieldDelegate

extension SignUpScreen: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
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
        stackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .darkGray
        
        let signUpButtonAction = #selector( didTappedSignUpButton(_:))
        signUpButton.addTarget(self, action: signUpButtonAction, for: .touchUpInside)
    }
}
