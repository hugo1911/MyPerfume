//
//  MenuView.swift
//  MyPerfume
//
//  Created by Hugo Manzano on 07/02/25.
//

import SwiftUI

struct MenuView: View {
    let options: [String]
    @Binding var selectedOption: String?
    @State private var isMenuVisible = true

    var body: some View {
        if isMenuVisible {
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(option) {
                        selectedOption = option
                        print("Selected: \(option)")
                        isMenuVisible = false
                    }
                }
            } label: {
                Label(selectedOption ?? "Agregue la nota predominante", systemImage: "list.bullet")
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
    MenuView(options: ["Option 1", "Option 2", "Option 3"], selectedOption: .constant(nil))
}
