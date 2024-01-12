//
//  ViewController.swift
//  TestProject
//
//  Created by Miguel Mexicano Herrera on 11/01/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var txtNumber1: UITextField!
    @IBOutlet weak var txtNumber2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtNumber1.backgroundColor = .red
    }

    @IBAction func addTwoNumbers(_ sender: Any) {
        let numberOne = Double(txtNumber1.text ?? "tex") ?? 0.0
        let numberTwo = Double(txtNumber2.text ?? "0") ?? 0
        let result = numberOne + numberTwo
        //print(result)
        resultLbl.text = "El resultado es : \(result)"
    }
    
}

