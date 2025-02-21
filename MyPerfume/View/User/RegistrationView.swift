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
            VStack{
                Text("Registro de Usuario")
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                TextField("Nombre", text: .constant(""))
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                TextField("Ingrese su contraseña", text: .constant(""))
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                NavigationLink(destination: MainView()
                    .navigationBarBackButtonHidden(true)
                ) {
                    Text("Registrarse")
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .padding(.bottom, 80)
                
            }
        }
        
    }
}

#Preview {
    RegistrationView()
}
