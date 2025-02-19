//
//  AddPerfume.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 06/02/25.
//

import SwiftUI

struct AddPerfume: View {
    @State var viewModel = perfumeViewModel(perfume: [])
    
    @State private var perfumeName = ""
    @State private var perfumeBrand = ""
    @State private var perfumePrice = ""
    @State private var perfumeDescription = ""
    @State private var perfumeNotes = ""
    @State private var perfumeImage: UIImage?
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.brown]),
                          startPoint: .top, endPoint: .bottom))
                    .edgesIgnoringSafeArea(.all)
                
                Form {
                    Section {
                        TextField("Nombre", text: $perfumeName)
                        TextField("Marca", text: $perfumeBrand)
                        MenuView(options: ["Marino", "Madera", "Vainilla"])
                        TextField("Precio", text: $perfumePrice)
                            .keyboardType(.decimalPad)
                        TextField("Descripción", text: $perfumeDescription)
                        TextField("Notas", text: $perfumeNotes)
                        
                        ImagePickerView()
                        
                        Button("Guardar Perfume") {
                            let newPerfume = PerfumeData(
                                id: UUID(),
                                name: perfumeName,
                                brand: perfumeBrand,
                                price: Double(perfumePrice) ?? 0.0,
                                description: perfumeDescription,
                                perfumeImage: "PerfumeImage",
                                isFavorite: false,
                                notes: perfumeNotes
                            )
                            
                            viewModel.addPerfume(newPerfume)
                            dismiss()
                        }
                        .disabled(perfumeName.isEmpty || perfumeBrand.isEmpty)
                    } header: {
                        Text("Información del perfume")
                            .foregroundStyle(.white)
                    }
                    .listRowBackground(Color.white)
                }
                .scrollContentBackground(.hidden)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancelar") {
                        dismiss()
                    }
                    .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    AddPerfume()
}
