//
//  InformationBlock.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 10/02/25.
//

import SwiftUI

struct InformationBlock: View {
    let perfume: PerfumeData
    @State private var showDetails = false  // Para controlar si mostrar detalles
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                // Siempre muestra el nombre
                Text(perfume.name)
                    .font(.headline)
                    .foregroundStyle(.black)
                    .padding(.bottom, 5)
                
                // Detalles que aparecen solo cuando showDetails es true
                if showDetails {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Marca: \(perfume.brand)")
                        Text("Precio: $\(String(format: "%.2f", perfume.price))")
                        Text("Notas: \(perfume.notes)")
                        Text(perfume.description)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
            }
            .padding()
        }
        .frame(width: 170, height: showDetails ? 250 : 170)  // Altura dinámica
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 2)
        )
        .onTapGesture {
            withAnimation(.spring()) {
                showDetails.toggle()  // Cambia el estado al tocar
            }
        }
    }
}

// Preview
#Preview {
    InformationBlock(perfume: PerfumeData(
        id: UUID(),
        name: "Perfume 1",
        brand: "Marca",
        price: 99.99,
        description: "Una fragancia única",
        perfumeImage: "PerfumeImage",
        isFavorite: false,
        notes: "Notas florales"
    ))
}
