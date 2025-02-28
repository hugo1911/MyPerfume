//
//  Validation.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 2/24/25.
//

import Foundation
import SwiftUI


func isPasswordValid(_ password: String) -> Bool {
    
    var isPasswordValidLength: Bool {
        return password.count >= 6
    }
    
    var doPasswordContainNumber: Bool {
        return password.contains(where: {$0.isNumber})
    }
    
    var doPasswordContainUpperCase: Bool {
        return password.contains(where: {$0.isUppercase})
    }
    
    var isPassowrdValid: Bool {
        doPasswordContainNumber &&
        doPasswordContainUpperCase &&
        isPasswordValidLength
    }
    
    return isPassowrdValid
}
