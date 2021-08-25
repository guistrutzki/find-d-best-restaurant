//
//  LaunchScreenVC.swift
//  FindDBestRestaurant
//
//  Created by Alexandre Cardoso on 23/08/21.
//

import UIKit
import Lottie

final class LaunchScreenVC: UIViewController {
	
	private var titleLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "FIND D BEST"
		label.textAlignment = .center
		label.font = UIFont(name: "HelveticaNeue-Bold", size: 50)
		label.textColor = .white
		label.adjustsFontSizeToFitWidth = true
		label.minimumScaleFactor = 20
		return label
	}()
	
	private var subtitleLabel: UILabel = {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Restaurant"
		label.textAlignment = .center
		label.font = UIFont(name: "HelveticaNeue-Light", size: 30)
		label.textColor = .white
		label.adjustsFontSizeToFitWidth = true
		label.minimumScaleFactor = 20
		return label
	}()
	
	private var animationLottieView: AnimationView = {
		let lottieView = AnimationView(frame: .zero)
		let animation = Animation.named("restaurant")
		
		lottieView.translatesAutoresizingMaskIntoConstraints = false
		lottieView.animation = animation
		lottieView.contentMode = .scaleAspectFit
		lottieView.backgroundColor = UIColor(named: "backgroundColorFind")
		lottieView.play(fromFrame: 0, toFrame: 200, loopMode: .loop)
        lottieView.animationSpeed = 1.5
		return lottieView
	}()

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor(named: "BackgroundLottie")
		configureSubviews()
		configureConstraints()
	}
	
	
	// MARK: - Function
	private func configureSubviews() {
		view.addSubview(titleLabel)
		view.addSubview(subtitleLabel)
		view.addSubview(animationLottieView)
	}
	
	private func configureConstraints() {
		titleLabel.snp.makeConstraints { make in
			make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
			make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
			make.right.equalTo(view.safeAreaLayoutGuide).inset(20)
		}

		subtitleLabel.snp.makeConstraints { make in
			make.top.equalTo(titleLabel.snp.bottom).offset(3)
			make.left.right.equalTo(titleLabel)
		}

		animationLottieView.snp.makeConstraints { make in
			make.top.equalTo(subtitleLabel.snp.bottom).offset(50)
			make.height.width.equalTo(300)
			make.centerX.equalToSuperview()
		}
	}
	
}
