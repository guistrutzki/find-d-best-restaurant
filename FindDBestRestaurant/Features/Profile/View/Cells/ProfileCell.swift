//
//  ProfileCell.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 31/08/21.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier = String(describing: ProfileCell.self)
    
    // MARK: - UI Element
    
    private var card: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.backgroundColor = Colors.red500
        return view
    }()
    
    private lazy var iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.contentMode = .scaleAspectFit
        return iconImage
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.contentMode = .left
        return label
    }()

    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    
    func configureCell(section: Int) {
        switch ProfileScreen.ProfileSection(rawValue: section) {
        case .resetPassword:
            return setupForResetPassword()
        case .signIn:
            return setupForSignIn()
        case .signUp:
            return setupForSignUp()
        default:
            break
        }
    }
    
    // MARK: - Private Functions
   
    private func setupForResetPassword() {
        self.titleLabel.text = "Recuperar senha"
        self.iconImage.image = Images.padlock
    }
    
    private func setupForSignIn() {
        self.titleLabel.text = "Entrar"
        self.iconImage.image = Images.login
    }
    
    private func setupForSignUp() {
        self.titleLabel.text = "Cadastre-se"
        self.iconImage.image = Images.register
    }
}

// MARK: - CodeView Extension

extension ProfileCell: CodeView {
    
    func buildViewHierarchy() {
        addSubview(card)
        card.addSubview(iconImage)
        card.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        card.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(16)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().inset(8)
        }
        
        iconImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImage.snp.right).offset(8)
            make.right.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
