//
//  Teste1ViewController.swift
//  FindDBestRestaurant
//
//  Created by Bruna Drago on 10/09/21.
//

import UIKit

class Teste1ViewController: UIViewController {

    // MARK: - VARIABLE

    var controller = Teste1Controller()

    lazy var Teste1Screen: Teste1Screen = {
        return Teste1Screen()
    }()


    // MARK: - Private Properties


    // MARK: - View Lifecycle
    
    
    override func loadView() {
        view = Teste1Screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Teste1ViewControllerProtocol Extension

extension Teste1ViewController: Teste1ViewControllerProtocol {

}
