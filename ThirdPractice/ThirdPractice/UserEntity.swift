//
//  UserEntity.swift
//  ThirdPractice
//
//  Created by Miguel Mexicano Herrera on 15/01/24.
//
import Foundation
enum UserType: Codable {
    case Admin
    case User
    case Client
}
struct User: Codable {
    let name: String
    let type: UserType
    let edad: Int
}
