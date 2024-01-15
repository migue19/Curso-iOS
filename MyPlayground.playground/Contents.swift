//import UIKit
//
///// Var   Let
/////
/////
//
///// Int , Float, Double, String, Array, Tupla, Matriz, Typealias ,genic
///// Estruct1.estruc2.struct3
///// TypeAlias response = Estruct1.estruc2.struct3
//
//var contador: Int = 1
//contador = 2
//print("\(contador)")
//
//
//var contadorlet = 1
//contadorlet = 2
//print("\(contadorlet)")
//
//24.56 + 98.66
//
//24.567896
//
//24.548942562312
//
//let pi = 3.1416
//
//var areatriangulo = 0
//
//
//areatriangulo = 60*3
//
//suma2Numeros(a: 5, b: 3)
//
//let result1 = (25.4 * 98 * (45+12)) / 12
//
//let result = suma2Numeros(a: 5.7878545, b: 3.565)
//let resultFormat = String(format: "%.2f", result)
//let resultRounded = round(result)
//let resultFormat2 = String(format: "%f", resultRounded)
//print(resultFormat)
//
//func suma2Numeros(a: Int, b: Int) -> Int {
//    return a+b
//}
//
//func suma2Numeros(a: Double, b: Double) -> Double {
//    return a + b
//}

//func suma2Numeros(a: Float, b: Float)

//func suma2Numeros(a: String, b: String)

//func suma2Numeros(a: NSNumber, b: String)

//var greeting = "Hello, playground"

/// IF

//let edad = 18
//
//if edad >= 18 {
//    print("Puedes entrar")
//} else {
//    print("La edad para entrar es 18")
//}
//
//let manzanas = 1
//
//switch manzanas {
//case 6:
//    print("puedes hacer un pay")
//case 2:
//    print("Puedes compartir")
//case 1:
//    print("Disfruta")
//default:
//    print("Condición por defecto")
//    break
//}
enum UserType {
    case Admin
    case User
    case Client
}
struct User {
    let name: String
    let type: UserType
    let edad: Int
}

let user = User(name: "Miguel", type: .Admin, edad: 12)
let users: [User] = [
    User(name: "Juan", type: .Client, edad: 18),
    User(name: "Pedro", type: .User, edad: 42),
    User(name: "Antonio", type: .Admin, edad: 30)
]

print()
for user in users {
    print(user.name)
}
print()
let filter = users.filter({$0.edad > 18})
for item in filter {
    print(item.name)
}
let edades = users.map({$0.edad})

for edad in edades {
    print(edad)
}

//let sumAge = edades.reduce(0, { x, y in
//    x + y
//})

let sumAge = edades.reduce(1, *)

print(sumAge)

//switch user.type {
//case .Admin:
//    print("Hola Admin")
//case .User:
//    print("Hola User")
//case .Client:
//    print("Hola Cliente")
//}
//
//let array = [1,2,3,5,8,13,21,34]
//
//for index in array {
//    print(index)
//}
//
//for (index, item) in array.enumerated() {
//    print(index, item)
//}
//
//var cont = 19
//while cont != 0 {
//    print("contador: \(cont)")
//    cont -= 1
//}
//
//func sumaDos(a: Int, b: Int) -> Int {
//    return a+b
//}
