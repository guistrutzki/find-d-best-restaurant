//
//  InitialScreen.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 28/08/21.
//

import UIKit

class InitialScreen: UIView {
    
    // MARK: - UI Element
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "initial-screen-cover.png") ?? UIImage())
        imageView.contentMode = .scaleToFill
        imageView.applyGradient(isVertical: true, colorArray: [Colors.gradient900, Colors.gradient100])
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "FIND D BEST"
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 50)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 20
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Restaurant"
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 20
        return label
    }()
    
    private lazy var guestSignInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private lazy var guestButtonView: UIView = {
        let buttonView = UIView()
        return buttonView
    }()
    
    private lazy var guestButtonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = K.continueWithoutLogin
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = Colors.white
        return label
    }()
    
    private lazy var guestArrowImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "right-arrow.svg") ?? UIImage())
        imageView.contentMode = .scaleToFill
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var forgetPasswordWrapperView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var forgetPasswordLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.white
        label.text = K.forgetYourPassword
        return label
    }()
    
    private lazy var forgetPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.reset, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.handleForgetPasswordTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var signUpButton: FBRButton = {
        let button = FBRButton(backgroundColor: Colors.white, title: K.signUp, titleColor: Colors.red500)
        button.addTarget(self, action: #selector(self.handleSignUpTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var signInButton: FBRButton = {
        let button = FBRButton(backgroundColor: Colors.red500, title: K.enter, titleColor: Colors.white)
        button.addTarget(self, action: #selector(self.handleSignInTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Variable
    private weak var delegate: InitialScreenDelegate!
    
    
    // MARK: - Initialize
    init(_ delegate: InitialScreenDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Function
    @objc func handleGuestTap(_ sender: UITapGestureRecognizer) {
        self.guestButtonView.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.guestButtonView.alpha = 1.0
            self.delegate.didTappedSignInAsGuest()
         }
        
    }
    
    @objc private func handleForgetPasswordTap() {
        self.delegate.didTappedForgetPassword()
    }
    
    @objc private func handleSignUpTap() {
        self.delegate.didTappedSignUp()
    }
    
    @objc private func handleSignInTap() {
        self.delegate.didTappedSignIn()
    }
}

// MARK: - Extension CodeView
extension InitialScreen: CodeView {
    func buildViewHierarchy() {
        addSubview(backgroundImage)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(guestButtonView)
            guestButtonView.addSubview(guestButtonLabel)
            guestButtonView.addSubview(guestArrowImage)
        addSubview(forgetPasswordWrapperView)
            forgetPasswordWrapperView.addSubview(forgetPasswordLabel)
            forgetPasswordWrapperView.addSubview(forgetPasswordButton)
        addSubview(signUpButton)
        addSubview(signInButton)
    }
    
    func setupConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(100)
            make.left.equalTo(safeAreaLayoutGuide).offset(20)
            make.right.equalTo(safeAreaLayoutGuide).inset(20)
        }

        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
            make.left.right.equalTo(titleLabel)
        }
        
        guestButtonView.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(20)
            make.right.equalToSuperview().inset(20)
            make.width.equalTo(200)
        }
        
        guestButtonLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.centerY.equalToSuperview()
        }
        
        guestArrowImage.snp.makeConstraints { make in
            make.leading.equalTo(guestButtonLabel.snp.trailing).offset(10)
            make.top.centerY.equalToSuperview()
        }
        
        forgetPasswordWrapperView.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(245)
            make.height.equalTo(30)
        }
        
        forgetPasswordLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
        
        forgetPasswordButton.snp.makeConstraints { make in
            make.leading.equalTo(forgetPasswordLabel.snp.trailing).offset(5)
            make.centerY.equalTo(forgetPasswordLabel.snp.centerY)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.bottom.equalTo(forgetPasswordWrapperView.snp.bottom).inset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        signInButton.snp.makeConstraints { make in
            make.bottom.equalTo(signUpButton.snp.bottom).inset(65)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
    func setupAdditionalConfiguration() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleGuestTap(_:)))
        guestButtonView.addGestureRecognizer(tap)
    }
}
