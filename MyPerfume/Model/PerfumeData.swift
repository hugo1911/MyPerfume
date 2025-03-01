//
//  UserData.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 2/18/25.
//

import SwiftUI
import Observation

@Observable
class PerfumeData: Identifiable {
    var id: UUID
    var name: String
    var brand: String
    var price: Double
    var description: String
    var perfumeImage: UIImage
    var notes: [String]
    
    init(
        id: UUID = UUID(),
        name: String,
        brand: String,
        price: Double,
        description: String,
        perfumeImage: UIImage = UIImage(systemName: "photo") ?? UIImage(),
        notes: [String] = []
    ) {
        self.id = id
        self.name = name
        self.brand = brand
        self.price = price
        self.description = description
        self.perfumeImage = perfumeImage
        self.notes = notes
    }
}
