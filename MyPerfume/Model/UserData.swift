//
//  UserData.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 2/18/25.
//

import Foundation
import Observation

//Al final no agregamos nada de lo de autenticacion mas a fondo jajaj para el loginview
@Observable
class userData: Identifiable, Codable {
    var id: UUID
    var name: String
    var email: String
    var password: String
    var isLogged: Bool
        
    init(id: UUID, name: String, email: String, password: String, isLogged: Bool) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.isLogged = isLogged
    }
    
}
