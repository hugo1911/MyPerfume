//
//  AddPerfume.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 06/02/25.
//

import SwiftUI

struct AddPerfume: View {
    
    
    var addPerfume = perfumeViewModel(perfume: [])
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
                        TextField("Nombre", text: .constant(""))
                        TextField("Marca", text: .constant(""))
                        TextField("Precio", text: .constant(""))
                        TextField("Descripción", text: .constant(""))
                        TextField("Notas", text: .constant(""))
                        
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
