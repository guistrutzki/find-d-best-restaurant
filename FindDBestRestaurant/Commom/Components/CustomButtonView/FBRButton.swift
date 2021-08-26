//
//  FBRButton.swift
//  FindDBestRestaurant
//
//  Created by Guilherme Strutzki on 23/08/21.
//

import UIKit

class FBRButton: UIButton {
  // MARK: - Inits
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  convenience init(backgroundColor: UIColor, title: String) {
    self.init(frame: .zero)
    self.backgroundColor = backgroundColor
    self.setTitle(title, for: .normal)
  }
  // MARK: - Private Functions
  private func configure() {
    layer.cornerRadius = 8
    setTitleColor(.white, for: .normal)
    titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
    translatesAutoresizingMaskIntoConstraints = false
  }
}
