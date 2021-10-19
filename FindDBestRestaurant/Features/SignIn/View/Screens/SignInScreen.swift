//
//  SignInScreen.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 23/08/21.
//

import UIKit

class SignInScreen: UIView {
    
    // MARK: - UI Elements
    
    private lazy var emailTextField: CustomTextFieldView = {
        let textField = CustomTextFieldView()
        return textField
    }()
    
    private lazy var passwordTextField: CustomTextFieldView = {
        let textField = CustomTextFieldView()
        return textField
    }()
    
    private lazy var submitButton: FBRButton = {
        let button = FBRButton(backgroundColor: Colors.red500, title: K.enter, titleColor: .white)
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "arrow-left"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = K.enter
        return label
    }()
    
    lazy var forgetPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(K.forgetMyPassword, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return button
    }()
    
    private weak var delegate: SignInViewDelegate!
    
    init(_ delegate: SignInViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTappedBackButton(_ button: UIButton) {
        delegate.didTappedBackButton()
    }
    
    @objc private func didTappedForgetPassword(_ button: UIButton) {
        delegate.didTappedForgetPassword()
    }
    
    @objc private func didTappedSubmit(_ button: UIButton) {
        let emailText = emailTextField.customTextField.text
        let passwordText = passwordTextField.customTextField.text
        
        delegate.didTappedSignInSubmit(email: emailText, password: passwordText)
    }
}

// MARK: - Extensions

extension SignInScreen: CodeView {
    func buildViewHierarchy() {
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(forgetPasswordButton)
        addSubview(submitButton)
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
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        forgetPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.trailing.equalToSuperview().inset(20)
        }
        
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(forgetPasswordButton.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = Colors.gray500
        
        let backButtonAction = #selector(didTappedBackButton(_:))
        let submitButtonAction = #selector(didTappedSubmit(_:))
        let forgetPasswordAction = #selector(didTappedForgetPassword(_:))
        
        forgetPasswordButton.addTarget(self, action:forgetPasswordAction , for: .touchUpInside)
        submitButton.addTarget(self, action: submitButtonAction, for: .touchUpInside)
        backButton.addTarget(self, action: backButtonAction, for: .touchUpInside)
        
        emailTextField.configureTextFieldType(.email)
        passwordTextField.configureTextFieldType(.password)
    }
}
