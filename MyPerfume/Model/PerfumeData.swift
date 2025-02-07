//
//  PerfumeData.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 31/01/25.
//

import Foundation
import SwiftUI
import Observation

@Observable
class PerfumeData: Identifiable {
    
    var id: UUID
    var name: String
    var brand: String
    var price: Double
    var description: String
    var perfumeImage: String
    var isFavorite: Bool
    var notes: String
    
    init(id: UUID, name: String, brand: String, price: Double, description: String, perfumeImage: String, isFavorite: Bool, notes: String) {
        self.id = id
        self.name = name
        self.brand = brand
        self.price = price
        self.description = description
        self.perfumeImage = perfumeImage
        self.isFavorite = isFavorite
        self.notes = notes
    }
    
}
