//
//  RestaurantDetailScreen.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 01/09/21.
//

import UIKit

class RestaurantDetailScreen: UIView {
    
    // MARK: - UI Element
    
    private lazy var scrollView: UIScrollView = {
        return UIScrollView(frame: .zero)
    }()
    
    private lazy var scrollContent: UIView = {
        let contentView = UIView(frame: .zero)
        contentView.backgroundColor = .clear
        return contentView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray800
        return view
    }()

    private lazy var restaurantImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "rest-1")
        return imageView
    }()
    
    private lazy var loveItButton: FBRLoveItButton = {
        let button = FBRLoveItButton(frame: .zero)
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Nome do restaurante"
        return label
    }()
    
    private lazy var aboutRestaurantTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Sobre o restaurante"
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Oferecemos Carnes selecionadas servidas em sistemas de rodízio, acompanhadas de irresistível e variado buffet de saladas e pratos quentes."
        return label
    } ()
    
    private lazy var menuLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Menu"
        return label
    } ()
   
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = Colors.gray800
        tableView.isUserInteractionEnabled = true
        tableView.separatorColor = .clear
        return tableView
    }()
    
    enum TableViewSection: Int, CaseIterable {
        case menu = 0
        case gallery = 1
    }
  
    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Private Functions
    
    private func getMenuCell(index: IndexPath) -> UITableViewCell {
        let identifier = MenuTableCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for:index) as? MenuTableCell
        else { return UITableViewCell()}
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    private func getGalleryCell(index: IndexPath) -> UITableViewCell {
        let identifier = PhotoGalleryTableCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for:index) as? PhotoGalleryTableCell
        else { return UITableViewCell()}
        
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - CodeView

extension RestaurantDetailScreen: CodeView {
    
    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(scrollContent)
        scrollContent.addSubview(containerView)
        containerView.addSubview(restaurantImageView)
        restaurantImageView.addSubview(loveItButton)
        restaurantImageView.addSubview(nameLabel)
        containerView.addSubview(aboutRestaurantTitleLabel)
        containerView.addSubview(infoLabel)
        containerView.addSubview(menuLabel)
        containerView.addSubview(tableView)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.left.right.equalTo(safeAreaLayoutGuide)
            make.top.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        scrollContent.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        restaurantImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(300)
        }
        
        loveItButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.width.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(15)
        }
        
        aboutRestaurantTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(restaurantImageView.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(15)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutRestaurantTitleLabel.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
        }
        
        menuLabel.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(15)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(menuLabel.snp.bottom).offset(10)
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(600)
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = Colors.gray800
        
        tableView.delegate = self
        tableView.dataSource = self
        MenuTableCell.registerOn(tableView)
        PhotoGalleryTableCell.registerOn(tableView)
    }
}

extension  RestaurantDetailScreen: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableViewSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getMenuCell(index: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 16.0 : 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        return view
    }
}


