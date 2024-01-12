//
//  ResultController.swift
//  TestProject
//
//  Created by Miguel Mexicano Herrera on 12/01/24.
//

import Foundation
import UIKit
class ResultController: UIViewController {
    @IBOutlet weak var resultLbl: UILabel!
    var resultado: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        resultLbl.text = "El resultado es: \(resultado)"
    }
}
