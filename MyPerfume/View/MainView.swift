//Hugo Manzano 36231


import SwiftUI

struct MainView: View {
    @State private var perfumes: [PerfumeData] = []  // 🔹 Ahora perfumes está en @State
    @State private var isImagePresented = false
    
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
                        
                        Text("Total perfumes: \(perfumes.count)")
                        
                        if perfumes.isEmpty {
                            Text("No hay perfumes agregados")
                                .foregroundStyle(.white)
                                .padding()
                        } else {
                            ForEach(perfumes) { perfume in
                                InformationBlock(perfume: perfume)
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
                AddPerfume(perfumes: $perfumes)  // 🔹 Pasamos el binding correctamente
            }
            .onAppear {
                print("MainView se actualizó, perfumes actuales: \(perfumes.count)")
            }
        }
    }
}

#Preview {
        
    MainView()
}
