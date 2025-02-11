//
//  AddPerfumeFunc.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 06/02/25.
//

import Foundation

class perfumeViewModel {
    
    var perfume: [PerfumeData] = []
    
    init(perfume: [PerfumeData]) {
        self.perfume = perfume
    }
    
    
    func deletePerfume() {
        let delPerfume = perfume.remove(at: 0)
    }

    func aggregatePerfume() {
        let addPerfume = PerfumeData(id: UUID(), name: "Perfume", brand: "Brand", price: 0.0, description: "Description", perfumeImage: "PerfumeImage", isFavorite: false, notes: "Notes")
        perfume.append(addPerfume)
    }
    
}


