//
//  Lesson1.swift
//  Content
//
//  Created by Dilara Akdeniz on 16.08.2025.
//

import Foundation

func personalInfoCard() {
    
    var name : String = "Dilara"
    var surname : String = "Akdeniz"
    var age : Int = 24
    var height : Double = 1.62
    var weight : Double = 60.0
    var isStudent : Bool = false
    var job : String? = "Computer Engineer"
    var email : String?
    
    
    print("Name: \(name)")
    print("Surname: \(surname)")
    print("Age: \(age)")
    print("Height: \(height)")
    print("Weight: \(weight)")
    print("Is student? : \(isStudent)")
    
    
    if let job = job {
        print("Job: \(job)")
    } else {
        print("No job info!")
    }
    
    if let email = email {
        print("Email : \(email)")
    } else {
        print("No email info!")
    }
    
    
    
}
