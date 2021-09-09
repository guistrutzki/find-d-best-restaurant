//
//  EmptyFavoritesScreen.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 09/09/21.
//

import UIKit
import Lottie

class EmptyFavoritesScreen: UIView {
    
    // MARK: - UI Elements
    
    private var animationView: AnimationView = {
        let lottieView = AnimationView(frame: .zero)
        let animation = Animation.named("restaurantAnimation")
        
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        lottieView.animation = animation
        lottieView.contentMode = .scaleAspectFit
        lottieView.backgroundColor = UIColor(named: "backgroundColorFind")
        lottieView.play(fromFrame: 0, toFrame: 200, loopMode: .loop)
        lottieView.animationSpeed = 1.5
        return lottieView
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = ""
        return label
    }()
    
    private lazy var subtitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        label.text = ""
        return label
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

// MARK: - CodeView extension

extension EmptyFavoritesScreen: CodeView {
    
    func buildViewHierarchy() {
        addSubview(animationView)
        addSubview(title)
        addSubview(subtitle)
    }
    
    func setupConstraints() {
        animationView.snp.makeConstraints { make in
            make.width.height.equalTo(128)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16)
        }
        
        title.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.top.equalTo(animationView.snp.bottom).offset(8)
        }
        
        subtitle.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.top.equalTo(title.snp.bottom).offset(8)
        }
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
