//
//  UserData.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 2/18/25.
//

import SwiftUI

struct RegistrationView: View {
    
    
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    // Estados para cada requisito
    @State private var hasMinLength = false
    @State private var hasNumber = false
    @State private var hasUppercase = false
    @State private var hasSpecialChar = false
    
    // Esto es para verificar si todos los requisitos se cumplen
    private var isPasswordValid: Bool {
        return hasMinLength && hasNumber && hasUppercase && hasSpecialChar
    }
    
    var body: some View {
        
        
        VStack {
            
            VStack{
                
                
                Text("Registro de Usuario")
                    .font(.title)
                    .foregroundStyle(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .foregroundStyle(.black)
                
                TextField("  Nombre", text: $username)
                    .foregroundStyle(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                        
                    )
                    .padding()
                
                //Hace que la contraseña salga con puntitos
                SecureField("  Ingrese su contraseña", text: $password)
                    .foregroundStyle(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                        
                    )
                    .onChange(of: password) { validatePassword() }
                
            }
            .padding(.bottom, 50)
            
            
            HStack{
                
                Text("💡")
                    .font(.title)
                
                Text("La contraseña debe cumplir lo siguiente")
                    .foregroundStyle(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
            }
            .padding(.leading, 40)
            
            // Requisitos con checks
            HStack {
                Text("Al menos 8 caracteres")
                    .foregroundStyle(.black)
                    .frame(width: 270, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                        
                    )
                Spacer()
                Image(systemName: hasMinLength ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(hasMinLength ? .green : .red)
            }
            .frame(width: 300, height: 50)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 25)
            
            HStack {
                Text("Al menos un numero")
                    .foregroundStyle(.black)
                    .frame(width: 270, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                        
                    )
                Spacer()
                Image(systemName: hasNumber ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(hasNumber ? .green : .red)
            }
            .frame(width: 300, height: 50)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 25)
            
            HStack {
                Text("Al menos una letra mayuscula")
                    .foregroundStyle(.black)
                    .frame(width: 270, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                        
                    )
                Spacer()
                Image(systemName: hasUppercase ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(hasUppercase ? .green : .red)
            }
            .frame(width: 300, height: 50)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 25)
            
            HStack {
                Text("Al menos un caracter especial")
                    .foregroundStyle(.black)
                    .frame(width: 270, height: 50)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                        
                    )
                Spacer()
                Image(systemName: hasSpecialChar ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(hasSpecialChar ? .green : .red)
            }
            .frame(width: 300, height: 50)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.bottom, 50)
            
            NavigationLink(destination: LoginView()
                .navigationBarBackButtonHidden(true)
            ) {
                Text("Registrarse")
                    .foregroundStyle(.black)
                    .frame(width: 300, height: 50)
                    .background(isPasswordValid ? Color.green : Color.gray.opacity(0.5))
                    .foregroundColor(isPasswordValid ? .black : .gray)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .disabled(!isPasswordValid)
            .padding(.bottom, 10)
            
            NavigationLink(destination: LoginView()
                .navigationBarBackButtonHidden(true)
            ) {
                Text("Ya tienes una cuenta?      Inicia sesión")
                    .foregroundStyle(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(.bottom, 80)
        }
    }
    
    
    // Función para validar la contraseña
    private func validatePassword() {
        // Validar longitud mínima
        hasMinLength = password.count >= 8
        
        // Validar al menos un número
        hasNumber = password.contains { $0.isNumber }
        
        // Validar al menos una mayúscula
        hasUppercase = password.contains { $0.isUppercase }
        
        // Validar al menos un carácter especial
        let specialCharacters = CharacterSet(charactersIn: "!@#$%^&*()_-+=<>?/|{}[]~.")
        hasSpecialChar = password.unicodeScalars.contains { specialCharacters.contains($0) }
    }
}

#Preview {
    RegistrationView()
}
