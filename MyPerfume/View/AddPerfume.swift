//
//  AddPerfume.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 06/02/25.
//

import SwiftUI

struct AddPerfume: View {
    
    
    var addPerfume = perfumeViewModel(perfume: [])
    @State private var perfumeName = ""
    @State private var perfumeBrand = ""
    @State private var perfumePrice = ""
    @State private var perfumeDescription = ""
    @State private var perfumeNotes = ""
    @State private var perfumeImage: UIImage?
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        //El zstack es para que el gradiente se aplique a toda la pantalla
        
        NavigationStack{
            ZStack {
                
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.brown]), startPoint: .top, endPoint: .bottom))
                    .edgesIgnoringSafeArea(.all)
                
                //ponemos el constant para que no se muestre el texto en gris
                Form {
                    Section(header: Text("Información del perfume").foregroundStyle(.white)) {
                        TextField("Nombre", text: $perfumeName)
                        TextField("Marca", text: $perfumeBrand)
                        MenuView(options: ["Marino", "Madera", "Vainilla"])
                        TextField("Descripción", text: $perfumeDescription)
                        
                        ImagePickerView()
                        
                        Button("Guardar Perfume") {
                            //guardar perfume
                            addPerfume.aggregatePerfume()
                        }
                        
                        
                        
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
