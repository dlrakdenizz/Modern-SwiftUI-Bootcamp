//
//  Lesson2.swift
//  Content
//
//  Created by Dilara Akdeniz on 16.08.2025.
//

import Foundation

func Calculator(_ a: Double, _ b : Double, operation : String){
    switch operation {
    case "+" : print("Sonuç: \(a + b)")
    case "-" : print("Sonuç: \(a - b)")
    case "*" : print("Sonuç: \(a * b)")
    case "/" :
        if b != 0 {
            print("Sonuç: \(a / b)")
        } else {
            print("Division Error!")
        }
    default :
        print("Invalid operation: \(operation)")
    }
}

func filterAndSort(array : [Int]) {
    let filteredArray = array.filter { $0 > 5}
    let sortedArray = filteredArray.sorted(by: <)
    
    print(sortedArray)
}


