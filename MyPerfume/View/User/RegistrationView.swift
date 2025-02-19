//
//  RegistrationView.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 2/18/25.
//

import SwiftUI

struct RegistrationView: View {
    var body: some View {
        ZStack{
            Image("PerfumeImage")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Text("Registro de Usuario")
                .frame(width: 300, height: 50)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            TextField("Nombre", text: .constant(""))
                
            
        }
    }
}

#Preview {
    RegistrationView()
}
