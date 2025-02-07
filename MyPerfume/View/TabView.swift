//
//  MainTabView.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 06/02/25.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                VStack {
                    MainView()
                        .font(.largeTitle)
                }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
                
                ImagePickerView()
                    .tabItem {
                        Label("Image Picker", systemImage: "photo")
                    }
                    .tag(1)
            }
        }
    }
}

#Preview {
    MainTabView()
}
