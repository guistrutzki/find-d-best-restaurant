//
//  SettingsScreen.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 21/09/21.
//

import UIKit

class SettingsScreen: UIView {
    // MARK: - UI Element
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray500
        return view
    }()
    
    private lazy var headerContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var avatarContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 40
        view.backgroundColor = UIColor("#cccccc", alpha: 0.6)
        return view
    }()
    
    public lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 40
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor("#ffffff", alpha: 0.6).cgColor
        image.image = Images.rubayat
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var labelTest: UIButton = {
        let label = UIButton()
        label.addTarget(self, action: #selector(self.handleImageTapped(_:)), for: .touchUpInside)
        return label
    }()
    
    private lazy var headerContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var headerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Fulano Silva"
        label.font = UIFont(name: Fonts.poppinsBold, size: 24)
        label.textColor = Colors.white
        return label
    }()
    
    private lazy var headerEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "fulano@hotmail.com"
        label.font = UIFont(name: Fonts.poppinsRegular, size: 14)
        label.textColor = Colors.gray200
        return label
    }()
    
    private lazy var editAvatarView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var editIconImage: UIImageView = {
        let image = UIImageView()
        image.image = Images.editIcon
        image.tintColor = .black
        return image
    }()
    
    private lazy var menuStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var updateNameItemView: UIView = {
        let view = UIView()
        view.addBottomBorder(with: UIColor("cccccc", alpha: 0.6), andWidth: 1.5)
        return view
    }()
    
    private lazy var updateEmailItemView: UIView = {
        let view = UIView()
        view.addBottomBorder(with: UIColor("cccccc", alpha: 0.6), andWidth: 1.5)
        return view
    }()
    
    private lazy var updatePasswordItemView: UIView = {
        let view = UIView()
        view.addBottomBorder(with: UIColor("cccccc", alpha: 0.6), andWidth: 1.5)
        return view
    }()
    
    private lazy var logoutItemView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var updateNameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Alterar nome", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.poppinsRegular, size: 18)
        button.addTarget(self, action: #selector(self.handleUpdateNameTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var updateEmailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Alterar e-mail", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.poppinsRegular, size: 18)
        return button
    }()
    
    private lazy var updatePasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Alterar senha", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.poppinsRegular, size: 18)
        return button
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sair", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Fonts.poppinsRegular, size: 18)
		 button.addTarget(self, action: #selector(handleLogoutTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Variables
    private weak var delegate: SettingsScreenDelegate!

   // MARK: - Initialize
    init(_ delegate: SettingsScreenDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - Obj Functions
    @objc private func handleUpdateNameTapped() {
        self.delegate.didTappedUpdateName()
    }
	
	@objc private func handleLogoutTapped(_ sender: UIButton) {
		 self.delegate.didTappedLogout(sender)
	}
    
    @objc private func handleImageTapped(_ sender: UIButton) {
        self.delegate.chooseImage(sender)
    }
}

// MARK: - Extension CodeView
extension SettingsScreen: CodeView {
    func buildViewHierarchy() {
        addSubview(containerView)
        addSubview(headerContainerView)
        headerContainerView.addSubview(avatarContainerView)
        avatarContainerView.addSubview(avatarImageView)
        avatarContainerView.addSubview(editAvatarView)
        
        headerContainerView.addSubview(headerContentView)
        headerContentView.addSubview(headerTitleLabel)
        headerContentView.addSubview(headerEmailLabel)
        
        headerContainerView.bringSubviewToFront(editAvatarView)
        editAvatarView.addSubview(labelTest)
        editAvatarView.addSubview(editIconImage)
        
        addSubview(menuStackView)
        
        menuStackView.addArrangedSubview(updateNameItemView)
        menuStackView.addArrangedSubview(updateEmailItemView)
        menuStackView.addArrangedSubview(updatePasswordItemView)
        menuStackView.addArrangedSubview(logoutItemView)
        
        updateNameItemView.addSubview(updateNameButton)
        updateEmailItemView.addSubview(updateEmailButton)
        updatePasswordItemView.addSubview(updatePasswordButton)
        logoutItemView.addSubview(logoutButton)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        headerContainerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(containerView.safeAreaLayoutGuide).offset(40)
            make.height.equalTo(80)
        }
        
        avatarContainerView.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.leading.equalToSuperview().offset(25)
        }
        
        avatarImageView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        headerContentView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(avatarImageView.snp.trailing).offset(20)
            make.height.equalTo(50)
        }
        
        headerTitleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        
        headerEmailLabel.snp.makeConstraints { make in
            make.top.equalTo(headerTitleLabel.snp.bottom)
            make.leading.equalToSuperview()
        }
        
        editAvatarView.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.bottom.equalTo(avatarImageView.snp.bottom)
            make.trailing.equalTo(avatarImageView.snp.trailing)
        }
        
        editIconImage.snp.makeConstraints { make in
            make.width.height.equalTo(10)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        labelTest.snp.makeConstraints { make in
            make.width.height.equalTo(10)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        menuStackView.snp.makeConstraints { make in
            make.top.equalTo(headerContainerView.snp.bottom).offset(60)
            make.leading.trailing.equalToSuperview()
        }
        
        updateNameItemView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.equalTo(menuStackView.snp.left)
        }
        
        updateEmailItemView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.equalTo(menuStackView.snp.left)
        }
        
        updatePasswordItemView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.equalTo(menuStackView.snp.left)
        }
        
        logoutItemView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.equalTo(menuStackView.snp.left)
        }
        
        updateNameButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalToSuperview()
        }
        
        updateEmailButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalToSuperview()
        }
        
        updatePasswordButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalToSuperview()
        }
        
        logoutButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
