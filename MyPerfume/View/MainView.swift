//
//  MainView.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 06/02/25.
//

import SwiftUI



struct MainView: View {
        
    var perfume: [PerfumeData] = []
    
    
    
    @State private var isImagePresented = false
    var body: some View {
        
        NavigationStack{
            ZStack {
                
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.brown]), startPoint: .top, endPoint: .bottom))
                    .edgesIgnoringSafeArea(.all)
                
                
            }
            .toolbar {
                ToolbarItemGroup(placement: .principal) {
                    HStack {
                        Text("Bienvenido")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        Button {
                            isImagePresented = true // ✅ Activa la sheet cuando se presiona
                        } label: {
                            Image(systemName: "plus")
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
            .sheet(isPresented: $isImagePresented) { // ✅ La sheet está fuera del Button
                AddPerfume()
                    .navigationBarTitleDisplayMode(.inline)
                    .background(Color.black.edgesIgnoringSafeArea(.all))
                
                    
            }
            
        }
        
        
    }
}


#Preview {
    MainView()
}
