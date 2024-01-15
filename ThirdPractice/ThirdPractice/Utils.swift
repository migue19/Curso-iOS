//
//  Utils.swift
//  ThirdPractice
//
//  Created by Miguel Mexicano Herrera on 15/01/24.
//

import Foundation
struct Utils {
    static func saveToken(token: String) {
        let userDefault = UserDefaults.standard
        userDefault.set(token, forKey: "Token")
    }
    static func getToken() -> String {
        let userDefault = UserDefaults.standard
        let token = userDefault.string(forKey: "Token") ?? ""
        return token
    }
    static func saveUser(user: [User]) {
        let encoder = JSONEncoder()
        let userDefault = UserDefaults.standard
        do {
            let data = try encoder.encode(user)
            userDefault.set(data, forKey: "User")
        } catch {
            print("error \(error)")
        }
    }
    static func getUser() -> [User]? {
        let userDefault = UserDefaults.standard
        if let data = userDefault.data(forKey: "User") {
            let decoder = JSONDecoder()
            let user = try? decoder.decode([User].self, from: data)
            return user
        }
        return nil
    }
}
