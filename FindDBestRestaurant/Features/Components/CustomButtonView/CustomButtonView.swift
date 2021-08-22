//
//  CustomButtonView.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 22/08/21.
//

import UIKit

final class CustomButtonView: UIView {
	
	// MARK: - UI Element
	var customButton: UIButton = {
		let button = UIButton(frame: .zero)
		button.layer.cornerRadius = 8
		button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
		return button
	}()
	
	
	// MARK: - Initialize
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configureTitle(with name: String) {
		self.customButton.setTitle(name, for: .normal)
	}
	
	func configureColor(with color: UIColor) {
		self.customButton.backgroundColor = color
	}
	
}


// MARK: - Extension CodeView
extension CustomButtonView: CodeView {
	
	func buildViewHierarchy() {
		addSubview(customButton)
	}
	
	func setupConstraints() {
		customButton.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.left.equalToSuperview()
			make.trailing.equalToSuperview()
			make.bottom.equalToSuperview()
			make.height.equalTo(50)
		}
	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = .none
	}
	
}
