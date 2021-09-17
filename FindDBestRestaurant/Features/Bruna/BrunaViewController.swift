//
//  BrunaViewController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 10/09/21.
//

import UIKit

class BrunaViewController: UIViewController {
    
    // MARK: - Variable

    let controller = BrunaController()
    
    lazy var BrunaScreen: BrunaScreen = {
        return BrunaUIView()
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


