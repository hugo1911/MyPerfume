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
                    .padding(.bottom, 30)
                
                TextField(" Usuario", text: .constant(""))
                    .foregroundStyle(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                        
                    )
                    .padding()
                
                TextField(" Ingrese su contraseña", text: .constant(""))
                    .foregroundStyle(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                        
                    )
                    .padding()
                
                NavigationLink(destination: MainView()
                    .navigationBarBackButtonHidden(true)
                ) {
                    Text("Entrar!")
                        .foregroundStyle(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.green)
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
                            .foregroundStyle(.black)
                            .frame(width: 140, height: 50)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 2)
                                
                            )
                    }
                }
                
            }
            
        }
    }
}


#Preview {
    LoginView()
}
