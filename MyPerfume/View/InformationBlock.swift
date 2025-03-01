//
//  InformationBlock.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 10/02/25.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct InformationBlock: View {
    let perfume: PerfumeData
    @State private var showDetails = false  // Para controlar si mostrar detalles
    
    
    var body: some View {
        ZStack {
            Color.clear
            
            VStack {
                // Imagen del perfume
                
                // ! dice "si no se estan mostrando detalles continua"
                if !showDetails {
                    // Cuando no muestra detalles, la imagen es grande
                    Image(uiImage: perfume.perfumeImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 3)
                        .padding(.top, 5)
                } else {
                    // Cuando muestra detalles, la imagen es más pequeña
                    HStack(alignment: .top) {
                        Image(uiImage: perfume.perfumeImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(radius: 2)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Marca: \(perfume.brand)")
                                .foregroundStyle(.white)
                            Text("Precio: $\(String(format: "%.2f", perfume.price))")
                                .foregroundStyle(.white)
                        }
                        .font(.caption)
                        .foregroundStyle(.black)
                    }
                    .padding(.horizontal, 5)
                }
                
                // Siempre muestra el nombre este showDetailes true o false
                Text(perfume.name)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.top, showDetails ? 8 : 5)
                
                // Detalles que aparecen solo cuando showDetails es true
                if showDetails {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Notas: \(perfume.notes)")
                            .font(.caption)
                            .foregroundStyle(.white)
                        
                        Text(perfume.description)
                            .font(.caption2)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.leading)
                            .lineLimit(5)
                        
                        
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, 5)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 5)
        }
        .frame(width: 170, height: showDetails ? 250 : 170)  // Altura dinámica
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 2)
        )
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: showDetails)
        .onTapGesture {
            withAnimation {
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
        description: "Una fragancia única con notas florales y cítricas. Ideal para uso diario, con buena duración y proyección.",
        perfumeImage: UIImage(named: "imagen_de_perfume") ?? UIImage(systemName: "photo")!, // Usar imagen de sistema como fallback
        notes: ["Florales, cítricas"]
    ))
}
