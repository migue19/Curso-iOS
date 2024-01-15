//
//  ThirdViewController.swift
//  ThirdPractice
//
//  Created by Miguel Mexicano Herrera on 15/01/24.
//

import UIKit

class ThirdViewController: UIViewController {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hola Soy vista con Codigo"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continuar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.addSubview(titleLabel)
        self.view.addSubview(continueButton)
//        titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
//        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        continueButton.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16).isActive = true
//        continueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            continueButton.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
            continueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        let token = Utils.getToken()
        titleLabel.text = token
        guard let users = Utils.getUser() else {
            return
        }
        guard let pedro = users.filter({$0.name == "Pedro"}).first else {
            return
        }
        titleLabel.text = "Nombre: \(pedro.name) edad: \(pedro.edad)"
    }
    
    
    
}
