//
//  AddPerfumeFunc.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 06/02/25.
//

import Foundation
import Observation

@Observable
class perfumeViewModel {
    
    var perfume: [PerfumeData] = []
    
    init(perfume: [PerfumeData]) {
        self.perfume = perfume
    }
    
    // Elimina el primer elemento (función heredada)
    func deletePerfume() {
        if !perfume.isEmpty {
            let _ = perfume.remove(at: 0)
        }
    }
    
    // Nueva función para eliminar un perfume específico
    func deletePerfume(_ perfumeToDelete: PerfumeData) {
        if let index = perfume.firstIndex(where: { $0.id == perfumeToDelete.id }) {
            perfume.remove(at: index)
        }
    }

    func addPerfume(_ perfume: PerfumeData) {
        self.perfume.append(perfume)
    }
}


