//
//  Utils.swift
//  FourthPractice
//
//  Created by Miguel Mexicano Herrera on 17/01/24.
//

import Foundation
import UIKit
struct Utils {
    static func showAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        return alert
    }
}
extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = Utils.showAlert(title: title, message: message)
        self.present(alert, animated: true)
    }
}
