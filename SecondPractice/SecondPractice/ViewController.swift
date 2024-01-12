//
//  ViewController.swift
//  SecondPractice
//
//  Created by Miguel Mexicano Herrera on 12/01/24.
//

import UIKit
//Name
//Apellido
// Edad
//Sexo
// Escolaridad


class ViewController: UIViewController, SecondViewControllerDelegate {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToForm(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            /// show Alert
            return
        }
        secondViewController.delegate = self
        let navigation = self.navigationController
        navigation?.pushViewController(secondViewController, animated: true)
        //self.present(secondViewController, animated: true)
    }
    func sendData(alumno: Alumno) {
        //print(age, name)
        nameLbl.text = "El nombre es: \(alumno.name)"
        ageLbl.text = "La edad es: \(alumno.age)"
    }
}
//extension ViewController: SecondViewControllerDelegate {
//    func sendData(age: Int, name: String?) {
//        print(age, name)
//    }
//}
struct Alumno {
    let name: String
    let age: Int
}
