//
//  MainView.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 06/02/25.
//

import SwiftUI



struct MainView: View {
    var body: some View {
        
        NavigationView{
            ZStack {
                
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.brown]), startPoint: .top, endPoint: .bottom))
                    .edgesIgnoringSafeArea(.all)
                
                
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    
                    HStack{
                        Text("Bienvenido")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        Button{
                            print("Botón presionado")
                            
                        }label: {
                            Image(systemName: "plus")
                                .foregroundStyle(.white)
                            
                            
                        }
                        
                    }
                }
            }
            
        }
        
        
    }
}


#Preview {
    MainView()
}
