//
//  UpdateNameScreen.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 22/09/21.
//

import UIKit

class UpdateNameScreen: UIView {

    // MARK - UI Element
    private lazy var screenTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Alterar nome"
        label.font = UIFont(name: Fonts.poppinsBold, size: 26)
        label.textColor = Colors.white
        return label
    }()
    
    private lazy var nameTextField: CustomTextFieldView = {
        let textField = CustomTextFieldView()
        return textField
    }()
    
    private lazy var submitButton: FBRButton = {
        let button = FBRButton(backgroundColor: Colors.red500, title: K.save, titleColor: .white)
        return button
    }()
    
    // MARK: - Variables
    private weak var delegate: UpdateNameScreenDelegate!
    
    // MARK: - Initialize
    init(_ delegate: UpdateNameScreenDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Obj-C Funcs
    @objc private func didTappedSubmit(_ button: UIButton) {
        let nameText = nameTextField.customTextField.text
        

        
        delegate.didTappedSaveButton(name: nameText)
    }
}

// MARK: - Extension CodeView
extension UpdateNameScreen: CodeView {
    func buildViewHierarchy() {
        addSubview(screenTitleLabel)
        addSubview(nameTextField)
        addSubview(submitButton)
    }
    
    func setupConstraints() {
        screenTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
            make.leading.equalToSuperview().offset(25)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(screenTitleLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        submitButton.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = UIColor("#1C1C1E")
        
        let submitButtonAction = #selector(self.didTappedSubmit(_:))
        submitButton.addTarget(self, action: submitButtonAction, for: .touchUpInside)
        
        nameTextField.configureTextFieldType(.name)
    }
    
    
}
