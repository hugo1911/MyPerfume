//
//  AddPerfume.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 06/02/25.
//

import SwiftUI

struct AddPerfume: View {
    
    
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.brown]), startPoint: .top, endPoint: .bottom))
                .edgesIgnoringSafeArea(.all)
            
            Form {
                Section(header: Text("Información del perfume").foregroundStyle(.white)) {
                    TextField("Nombre", text: .constant(""))
                        .foregroundStyle(.white)
                }
                .listRowBackground(Color.black)
            }
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    AddPerfume()
}
