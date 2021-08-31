//
//  ProfileScreen.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 31/08/21.
//

import UIKit

class ProfileScreen: UIView {
    
    // MARK: - UI Elements
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.alpha = 1
        return view
        
    }()
    
    private lazy var restaurantImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.restaurant1
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Find D Best Restaurant"
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    // MARK: - Variable
    
    weak var delegate: ProfileScreenDelegate?
    
    enum ProfileSection: Int, CaseIterable {
        case signUp = 0
        case signIn = 1
        case resetPassword = 2
    }
    
    // MARK: - Inits
    
    init(_ delegate: ProfileScreenDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Functions
    
    private func getCardRestaurantCell(index: IndexPath) -> UITableViewCell {
        let identifier = ProfileCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for:index) as? ProfileCell
        else { return UITableViewCell()}
        
        cell.configureCell(section: index.section)
        cell.selectionStyle = .none
        
        return cell
    }
    
    private func proceedTo(forSection section: Int) {
        
        switch ProfileSection(rawValue: section) {
        case .signIn:
            delegate?.gotToSignIn()
        case .resetPassword:
            delegate?.gotToResetPassword()
        case .signUp:
            delegate?.goToSignUp()
        default:
            break
        }
    }
}

// MARK: - CodeView Extension

extension ProfileScreen: CodeView {
    
    func buildViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(restaurantImage)
        restaurantImage.addSubview(titleLabel)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.left.right.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(160)
        }
        
        restaurantImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(15)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(restaurantImage.snp.bottom).offset(80)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = Colors.gray500
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        ProfileCell.registerOn(tableView)
    }
}

// MARK: - UITableViewDataSource Extension

extension ProfileScreen: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ProfileSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getCardRestaurantCell(index: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = ProfileSection(rawValue: indexPath.section) else { return}
        proceedTo(forSection: section.rawValue)
    }
}
