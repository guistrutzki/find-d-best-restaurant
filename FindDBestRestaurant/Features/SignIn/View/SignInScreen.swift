//
//  SignInScreen.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 23/08/21.
//

import UIKit

class SignInScreen: UIView {
    
    // MARK: - UI Components
    
    lazy var emailTextField = CustomTextFieldView()
    lazy var passwordTextField = CustomTextFieldView()
    lazy var submitButton = CustomButtonView()
    
    // MARK: - UI Elements
    
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
        label.text = "Entrar"
        return label
    }()
    
    lazy var forgetPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueci minha senha", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return button
    }()

    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackground()
        self.configSuperView()
        self.setupContraints()
        
        self.emailTextField.configureTextFieldType(.email)
        self.passwordTextField.configureTextFieldType(.password)
        self.submitButton.configureTitle(with: "Entrar")
        self.submitButton.configureColor(with: Colors.red500)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup functions
    private func configBackground() {
        self.backgroundColor = Colors.gray500
    }
    
    private func configSuperView() {
        self.addSubview(self.backButton)
        self.addSubview(self.titleLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.forgetPasswordButton)
        self.addSubview(self.submitButton)
    }
    
    private func setupContraints() {
        self.configBackButtonConstraint()
        self.configTitleLabelConstraint()
        self.configEmailTextFieldConstraint()
        self.configPasswordTextFieldConstraint()
        self.configForgetPasswordButtonConstraint()
        self.configSubmitButtonConstraint()
    }
    
    // MARK: - Contraints
    
    private func configBackButtonConstraint() {
        self.backButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(26)
            make.height.equalTo(24)
        }
    }
    
    private func configTitleLabelConstraint() {
        self.titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.backButton.snp.centerY)
            make.centerX.equalToSuperview()
            make.height.equalTo(24)
        }
    }
    
    private func configEmailTextFieldConstraint() {
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func configPasswordTextFieldConstraint() {
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func configForgetPasswordButtonConstraint() {
        self.forgetPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(15)
            make.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func configSubmitButtonConstraint() {
        self.submitButton.snp.makeConstraints { make in
            make.top.equalTo(self.forgetPasswordButton.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
