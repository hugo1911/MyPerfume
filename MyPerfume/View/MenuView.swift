//
//  MenuView.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 07/02/25.
//

import SwiftUI

// Modular Menu View
struct MenuView: View {
    let options: [String] // Options passed in as a parameter
    @State private var selectedOption: String? // Binding to the selected option
    @State private var isMenuVisible = true // Control menu visibility

    var body: some View {
        if isMenuVisible {
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(option) {
                        selectedOption = option
                        print("Selected: \(option)")
                        isMenuVisible = false // Hide the menu after selection
                    }
                }
            } label: {
                Label(selectedOption ?? "Select an option", systemImage: "list.bullet")
            }
        } else {
            // Display the selected option
            if let selected = selectedOption {
                Text("Selected: \(selected)")
                    .padding()
            } else {
                EmptyView() // Or display a placeholder if nothing is selected
            }
        }
    }
}

#Preview {
    MenuView(options: ["Option 1", "Option 2", "Option 3"])
}
