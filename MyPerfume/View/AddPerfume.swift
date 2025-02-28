//hugo Manzano 36231

import SwiftUI

struct AddPerfume: View {
    var viewModel: perfumeViewModel
    
    @State private var perfumeName = ""
    @State private var perfumeBrand = ""
    @State private var perfumePrice: Double = 0.0
    @State private var perfumeDescription = ""
    @State private var perfumeNotes: String? = nil
    @State private var perfumeImage: UIImage?
    
    @Environment(\.dismiss) private var dismiss  // Para cerrar la vista

    var body: some View {
        NavigationStack {
            ZStack {
                // Fondo con degradado
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black, Color.brown]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .ignoresSafeArea()
                
                // Contenido principal
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Información del perfume")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        // Campo de Nombre
                        TextField("Nombre", text: $perfumeName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        
                        // Campo de Marca
                        TextField("Marca", text: $perfumeBrand)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        
                        // Campo de Precio
                        TextField("Precio", value: $perfumePrice, format: .number)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        
                        // Campo de Descripción
                        TextField("Descripción", text: $perfumeDescription)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        
                        // Menu de selección para nota
                        MenuView(options: ["Dulce", "Cítrico", "Amaderado", "Floral", "Oriental", "Fresco", "Especiado", "Verde", "Acuático", "Aromático"],
                                 selectedOption: $perfumeNotes)
                            .padding(.horizontal)
                        
                        // Selector de imagen
                        ImagePickerView(image: $perfumeImage)
                            .padding(.horizontal)
                        
                        // Botón para guardar el perfume
                        Button(action: {
                            // Se crea un nuevo perfume usando los datos ingresados
                            let newPerfume = PerfumeData(
                                id: UUID(),
                                name: perfumeName,
                                brand: perfumeBrand,
                                price: perfumePrice,
                                description: perfumeDescription,
                                perfumeImage: perfumeImage ?? UIImage(systemName: "photo")!,
                                // Convertimos la nota en array (si deseas una nota única)
                                notes: (perfumeNotes?.isEmpty == false) ? [perfumeNotes!] : []
                            )
                            
                            viewModel.addPerfume(newPerfume)
                            print("Perfume agregado: \(newPerfume.name), total perfumes: \(viewModel.perfume.count)")
                            dismiss()
                        }) {
                            Text("Guardar Perfume")
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        .disabled(perfumeName.isEmpty || perfumeBrand.isEmpty)
                        
                        Spacer()
                    }
                    .padding(.vertical)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancelar") {
                        dismiss()
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    AddPerfume(viewModel: perfumeViewModel(perfume: []))
}
