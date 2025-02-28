//
//  LoginView.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 2/18/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack{
            
            
            
            
            VStack{
                Text("Bienvenido a MyPerfume")
                    .foregroundStyle(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom, 100)
                
                TextField(" Usuario", text: .constant(""))
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                TextField(" Ingrese su contraseña", text: .constant(""))
                    .foregroundStyle(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                NavigationLink(destination: MainView()
                    .navigationBarBackButtonHidden(true)
                ) {
                    Text("Entrar!")
                        .foregroundStyle(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .padding(.bottom, 80)
                
                
                
                HStack{
                    Text("¿Olvidaste tu contraseña?")
                        .foregroundStyle(.black)
                        .frame(width: 150, height: 50)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    NavigationLink(destination: RegistrationView()) {
                        Text("Regístrese!")
                            .frame(width: 150, height: 50)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                
            }
            
        }
    }
}


#Preview {
    LoginView()
}
