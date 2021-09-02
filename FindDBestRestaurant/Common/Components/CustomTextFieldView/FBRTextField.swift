//
//  FBRTextField.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 25/08/21.
//

import UIKit

class FBRTextField: UITextField {

    // MARK: - Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   convenience init(placeholder: String) {
        self.init(frame: .zero)
        self.placeholder = placeholder
    }
    
    // MARK: - Private Functions
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        
        textColor = .white
        attributedPlaceholder =
            NSAttributedString(
                string: "placeholderColor",
                attributes: [NSAttributedString.Key.foregroundColor: Colors.gray200])
        
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        leftViewMode = .always
        
        backgroundColor = .systemGray
        autocorrectionType = .no
        clearButtonMode = .whileEditing
    }
}
