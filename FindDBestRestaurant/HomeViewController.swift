//
//  ViewController.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 12/08/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "FIND D BEST"
        label.font = UIFont.systemFont(ofSize: 40)
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Restaurant"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .black
        self.view = view
        
        addSubViewsToView()
        addSubviewConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Main View Controller"
        navigationController?.isNavigationBarHidden = true
    }
    
    func addSubViewsToView() {
        
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
    }
    
    func addSubviewConstraints() {
        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            
        ])
    }
}
