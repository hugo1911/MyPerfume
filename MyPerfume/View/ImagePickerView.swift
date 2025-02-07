//
//  ContentView.swift
//  MyPerfume
//ya debe haber
//  Created by Hugo Manzano on 07/01/25.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    // Es opcional porque no siempre vamos a estar presionando el botón
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var body: some View {
        
        VStack {
            PhotosPicker("Select a picture", selection: $pickerItem, matching: .images) //solo necesitamos imagenes
            
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
    ContentView()
}
