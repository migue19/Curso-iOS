import UIKit

/// Var   Let
///
///

/// Int , Float, Double, String, Array, Tupla, Matriz, Typealias ,genic
/// Estruct1.estruc2.struct3
/// TypeAlias response = Estruct1.estruc2.struct3

var contador: Int = 1
contador = 2
print("\(contador)")


var contadorlet = 1
contadorlet = 2
print("\(contadorlet)")

24.56 + 98.66

24.567896

24.548942562312

let pi = 3.1416

var areatriangulo = 0


areatriangulo = 60*3

suma2Numeros(a: 5, b: 3)

let result1 = (25.4 * 98 * (45+12)) / 12

let result = suma2Numeros(a: 5.7878545, b: 3.565)
let resultFormat = String(format: "%.2f", result)
let resultRounded = round(result)
let resultFormat2 = String(format: "%f", resultRounded)
print(resultFormat)

func suma2Numeros(a: Int, b: Int) -> Int {
    return a+b
}

func suma2Numeros(a: Double, b: Double) -> Double {
    return a + b
}

//func suma2Numeros(a: Float, b: Float)

//func suma2Numeros(a: String, b: String)

//func suma2Numeros(a: NSNumber, b: String)

var greeting = "Hello, playground"
