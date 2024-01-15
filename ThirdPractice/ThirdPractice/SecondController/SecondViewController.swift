//
//  SecondViewController.swift
//  ThirdPractice
//
//  Created by Miguel Mexicano Herrera on 15/01/24.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = Utils.getToken()
    }
}
