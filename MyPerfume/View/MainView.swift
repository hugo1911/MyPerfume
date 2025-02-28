import SwiftUI

struct MainView: View {
    @State private var viewModel = perfumeViewModel(perfume: [])
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
                        
                        Text("Total perfumes: \(viewModel.perfume.count)")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .gridCellColumns(2)
                        
                        if viewModel.perfume.isEmpty {
                            Text("No hay perfumes agregados")
                                .foregroundStyle(.white)
                                .padding()
                                .gridCellColumns(2)
                        } else {
                            ForEach(viewModel.perfume) { perfume in
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
                AddPerfume(viewModel: viewModel)
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
