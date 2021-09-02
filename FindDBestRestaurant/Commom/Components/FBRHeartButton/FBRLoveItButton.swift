//
//  FBRLoveItButton.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 01/09/21.
//

import UIKit

class FBRLoveItButton: UIView {
    
    // MARK: - User Interface Components
    
    private lazy var contentView: FBRCircularView = {
        let circularView = FBRCircularView(frame: .zero)
        circularView.backgroundColor = .white
        return circularView
    }()
    
    private lazy var heartButton: FBRHeartButton = {
        let button = FBRHeartButton(frame: .zero)
        return button
    }()
    
    // MARK: - Public Properties
    
    var isFilled: Bool {
        get {
            heartButton.isFilled
        }
        set {
            heartButton.isFilled = newValue
        }
    }
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Public Functions
    
    func toggleIt() {
        heartButton.toggleIt()
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        heartButton.addTarget(target, action: action, for: controlEvents)
    }
}

// MARK: - ViewCodeProtocol Extension

extension FBRLoveItButton: CodeView {
    
    func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(heartButton)
    }
    
    func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.bottom.right.equalToSuperview()
        }
        
        heartButton.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.bottom.right.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        heartButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
}
