//
//  UserData.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 2/18/25.
//

import SwiftUI

struct MainView: View {
    @State private var viewModel = perfumeViewModel(perfume: [])
    @State private var isImagePresented = false
    @StateObject private var locationManager = LocationManager()
    @State private var showDeleteAlert = false
    @State private var perfumeToDelete: PerfumeData?
    
    var body: some View {
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.brown]),
                          startPoint: .top, endPoint: .bottom))
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 20) {
                        
                        VStack{
                            
                            Text("Total perfumes: \(viewModel.perfume.count)")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .gridCellColumns(2)
                            
                            
                            Text("País: \(locationManager.country)")
                                .foregroundStyle(.white)
                                .font(.title)
                                .padding()
                        }
                        
                        
                        if viewModel.perfume.isEmpty {
                            Text("No hay perfumes agregados")
                                .foregroundStyle(.white)
                                .padding()
                                .gridCellColumns(2)
                        } else {
                            ForEach(viewModel.perfume) { perfume in
                                InformationBlock(perfume: perfume)
                                    .onLongPressGesture {
                                        // Almacena el perfume que se desea eliminar
                                        perfumeToDelete = perfume
                                        // Muestra la alerta de confirmación
                                        showDeleteAlert = true
                                    }
                            }
                        }
                    }
                    .padding()
                }
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
                            isImagePresented = true
                        } label: {
                            Image(systemName: "plus")
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
            .sheet(isPresented: $isImagePresented) {
                AddPerfume(viewModel: viewModel)
            }
            .alert("Eliminar Perfume", isPresented: $showDeleteAlert) {
                Button("Cancelar", role: .cancel) {
                    perfumeToDelete = nil
                }
                Button("Eliminar", role: .destructive) {
                    if let perfume = perfumeToDelete {
                        viewModel.deletePerfume(perfume)
                        perfumeToDelete = nil
                    }
                }
            } message: {
                if let perfume = perfumeToDelete {
                    Text("¿Estás seguro de que quieres eliminar '\(perfume.name)'?")
                } else {
                    Text("¿Estás seguro de que quieres eliminar este perfume?")
                }
            }
            .onAppear {
                print("MainView se actualizó, perfumes actuales: \(viewModel.perfume.count)")
                
                //prueba
                if viewModel.perfume.isEmpty {
                    let testPerfume = PerfumeData(
                        name: "Perfume de Prueba",
                        brand: "Marca Test",
                        price: 99.99,
                        description: "Perfume para depuración",
                        perfumeImage: UIImage(systemName: "photo") ?? UIImage(),
                        notes: ["Test"]
                    )
                    viewModel.addPerfume(testPerfume)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
