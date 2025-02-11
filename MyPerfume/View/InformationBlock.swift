//
//  InformationBlock.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 10/02/25.
//

import SwiftUI

struct InformationBlock: View {
    
    var body: some View {
        ZStack {
            Color.white
            
            Text("Hola")
                .foregroundStyle(.red)
                .padding()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 2)
                .frame(width: 170, height: 170)
        )
        
        
        
        
    }
}


#Preview {
    InformationBlock()
}
