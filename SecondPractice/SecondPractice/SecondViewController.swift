//
//  SecondViewController.swift
//  SecondPractice
//
//  Created by Miguel Mexicano Herrera on 12/01/24.
//

import Foundation
import UIKit

protocol SecondViewControllerDelegate {
    func sendData(alumno: Alumno)
}

class SecondViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    var delegate: SecondViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func sendData() {
        let name = txtName.text ?? ""
        let age = Int(txtAge.text ?? "0") ?? 0
        if let delegate = delegate {
            let alumno = Alumno(name: name, age: age)
            delegate.sendData(alumno: alumno)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
