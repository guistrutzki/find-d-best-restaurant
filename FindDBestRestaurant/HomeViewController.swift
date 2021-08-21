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
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.backgroundColor = UIColor(red: 0.904, green: 0.188, blue: 0.188, alpha: 1).cgColor
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)

        button.layer.cornerRadius = 8
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(UIColor(red: 0.906, green: 0.188, blue: 0.188, alpha: 1), for: .normal)
        button.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 8
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)

        return button
    }()
    
    lazy var continueWithoutLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continuar sem login  >", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(continueWithoutLoginButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var topGrandientView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.height * 0.3)
        
        let layer0 = CAGradientLayer()
        layer0.colors = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        ]
        layer0.locations = [0.48, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer0.position = view.center
        view.layer.addSublayer(layer0)
        
        return view
    }()
    
    lazy var bottomGrandientView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.height * 0.3)
        
        let layer0 = CAGradientLayer()
        layer0.colors = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        ]
        
        layer0.locations = [0.48, 1]
        layer0.endPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.startPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer0.position = view.center
        view.layer.addSublayer(layer0)
        
        return view

    }()
    
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ImageDeFundoDaTelaInicial")
        
        return imageView
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
    
    @objc func loginButtonPressed() {
        let vc  = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func registerButtonPressed() {

    }
    
    @objc func continueWithoutLoginButtonPressed() {
        let vc = MainViewController()
        navigationController?.pushViewController(vc, animated: true)

    }

    func addSubViewsToView() {
        view.addSubview(backgroundImage)
        view.addSubview(topGrandientView)
        view.addSubview(bottomGrandientView)
        
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        view.addSubview(continueWithoutLoginButton)
    }
    
    func addSubviewConstraints() {
        NSLayoutConstraint.activate([
            
            topGrandientView.topAnchor.constraint(equalTo: view.topAnchor),
            topGrandientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topGrandientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topGrandientView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            bottomGrandientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomGrandientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomGrandientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomGrandientView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),

            backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -20),
            
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.bottomAnchor.constraint(equalTo: continueWithoutLoginButton.topAnchor, constant: -40),
            
            continueWithoutLoginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueWithoutLoginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
