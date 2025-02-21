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
    
    
    func deletePerfume() {
        let delPerfume = perfume.remove(at: 0)
    }

    func addPerfume(_ perfume: PerfumeData) {
        self.perfume.append(perfume)
    }
    
}


