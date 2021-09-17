//
//  TesteBViewController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 10/09/21.
//

import UIKit

class TesteBViewController: UIViewController {
    
    // MARK: - Variable

    let controller = TesteBController()
    
    lazy var TesteBview: TesteBUIView = {
        return TesteBUIView()
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


