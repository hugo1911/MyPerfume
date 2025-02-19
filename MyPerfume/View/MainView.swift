//hugo Manzano 36231

import SwiftUI

struct MainView: View {
    @State private var viewModel = perfumeViewModel(perfume: [])
    @State private var isImagePresented = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Fondo
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.brown]),
                          startPoint: .top, endPoint: .bottom))
                    .edgesIgnoringSafeArea(.all)
                
                // Grid de perfumes
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 20) {
                        if viewModel.perfume.isEmpty {
                            Text("No hay perfumes agregados")
                                .foregroundStyle(.white)
                                .padding()
                        } else {
                            ForEach(viewModel.perfume) { perfume in
                                InformationBlock(perfume: perfume)
                            }
                        }
                    }
                    .padding()
                }
            }
            // Tu toolbar original
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
                AddPerfume()
                    .navigationBarTitleDisplayMode(.inline)
                    .background(Color.black.edgesIgnoringSafeArea(.all))
            }
        }
    }
}

// Preview
#Preview {
    MainView()
}
