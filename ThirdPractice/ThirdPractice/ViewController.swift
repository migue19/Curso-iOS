//
//  ViewController.swift
//  ThirdPractice
//
//  Created by Miguel Mexicano Herrera on 15/01/24.
//

import UIKit

class ViewController: UIViewController {
    let token = "15618415315684156"
    let users: [User] = [
        User(name: "Juan", type: .Client, edad: 18),
        User(name: "Pedro", type: .User, edad: 42),
        User(name: "Antonio", type: .Admin, edad: 30)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.saveToken(token: token)
        Utils.saveUser(user: users)
        // Do any additional setup after loading the view.
    }
    @IBAction func goToCodeControiler(_ sender: Any) {
        let thirdController = ThirdViewController()
        self.navigationController?.pushViewController(thirdController, animated: true)
    }
    @IBAction func goToNextController(_ sender: Any) {
        let secondController = SecondViewController()
        self.navigationController?.pushViewController(secondController, animated: true)
    }
}

