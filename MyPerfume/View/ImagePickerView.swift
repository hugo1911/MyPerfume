//
//  ImagePickerView.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 07/01/25.
//

import SwiftUI
import PhotosUI

struct ImagePickerView: View {
    
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: UIImage?
    @State private var isImagePresented: String = "Selecciona una vista"
    
    var body: some View {
        VStack(spacing: 20) {
            
            
            Text(isImagePresented)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            
            PhotosPicker(selection: $pickerItem, matching: .images) {
                VStack {
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .shadow(radius: 5)
                    } else {
                        VStack {
                            Image(systemName: "photo.on.rectangle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white.opacity(0.8))
                            Text("Elegir Imagen")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .frame(width: 200, height: 200)
                        .background(Color.blue.opacity(0.7))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 5)
                    }
                }
            }
            .buttonStyle(PlainButtonStyle()) // Quita el efecto predeterminado de PhotosPicker
            
        }
        .padding()
        .onChange(of: pickerItem) {
            Task {
                if let data = try? await pickerItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                }
                isImagePresented = "" //quitamos el texto de seleccionar una imagen
            }
        }
    }
}

#Preview {
    ImagePickerView()
}
