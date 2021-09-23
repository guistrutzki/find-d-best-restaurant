//
//  BrunaTesteViewController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 10/09/21.
//

import UIKit

class BrunaTesteViewController: UIViewController {
    
    // MARK: - Variable

    let controller = BrunaTesteController()
    
    lazy var BrunaTesteScreen: BrunaTesteScreen = {
        return BrunaTesteUIView()
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

// MARK: - BrunaTesteCodeView Extension

extension BrunaTesteViewController: ___VARIABLE_productName : identifier___ScreenDelegate{
    
}
