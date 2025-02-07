//
//  ContentView.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 07/01/25.
//

import SwiftUI
import PhotosUI

struct ImagePickerView: View {
    
    // Es opcional porque no siempre vamos a estar presionando el botón
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var body: some View {
        
        VStack {
            Text("Selecciona una imagen")
            PhotosPicker(selection: $pickerItem, matching: .images) {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            
            selectedImage?
                .resizable()
                .scaledToFit()
        }
        .onChange(of: pickerItem) {
            Task {
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
            }
        }
        
    }
}

#Preview {
    ImagePickerView()
}
