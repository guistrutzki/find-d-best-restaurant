//
//  testeViewController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 10/09/21.
//

import UIKit

class testeViewController: UIViewController {
    
    // MARK: - Variable

    let controller = testeController()
    
    lazy var testeview: testeUIView = {
        return testeUIView()
    }()

    // MARK: - Life cycle
    
    override func loadView() {
        view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private Functions
}


