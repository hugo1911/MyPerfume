//
//  PerfumeData.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 31/01/25.
//

import Foundation

struct PerfumeData: Identifiable {
    
    var id: UUID
    var name: String
    var brand: String
    var price: Double
    var description: String
    var perfumeImage: String
    var isFavorite: Bool
    var notes: String
    
}
