//
//  UpdatePasswordScreen.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 09/12/21.
//

import UIKit

class UpdatePasswordScreen: UIView {
    private let screenTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Alterar sua senha"
        label.font = UIFont(name: Fonts.poppinsBold, size: 26)
        label.textColor = Colors.white
        return label
    }()
    
    private let passwordTextField: CustomTextFieldView = {
        let textField = CustomTextFieldView()
        return textField
    }()
    
    private let confirmPasswordTextField: CustomTextFieldView = {
        let textField = CustomTextFieldView()
        return textField
    }()
    
    private let submitButton: FBRButton = {
        let button = FBRButton(backgroundColor: Colors.red500,
                               title: K.save,
                               titleColor: Colors.white)
        return button
    }()
    
    private weak var delegate: UpdatePasswordScreenDelegate!
    
    init(_ delegate: UpdatePasswordScreenDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Obj-C Funcs
    @objc private func didTappedSubmit(_ button: UIButton) {
        let password = passwordTextField.customTextField.text
        let confirmPassword = confirmPasswordTextField.customTextField.text
        
        if (password == confirmPassword) {
            delegate.didTappedSaveButton(password: password)
        }
    }
}

extension UpdatePasswordScreen: CodeView {
    func buildViewHierarchy() {
        addSubview(screenTitleLabel)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(submitButton)
    }
    
    func setupConstraints() {
        screenTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
            make.leading.equalToSuperview().offset(25)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(screenTitleLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = UIColor("#1C1C1E")
        
        let submitButtonAction = #selector(self.didTappedSubmit(_:))
        submitButton.addTarget(self, action: submitButtonAction, for: .touchUpInside)
        
        passwordTextField.configureTextFieldType(.password)
        confirmPasswordTextField.configureTextFieldType(.password)
        passwordTextField.customTextField.placeholder = "Digite sua nova senha"
        confirmPasswordTextField.customTextField.placeholder = "Digite sua senha atual"
    }
}
