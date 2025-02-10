//
//  PressButton.swift
//  ListAppTest
//
//  Created by Andrii Marchuk on 29.01.2025.
//

import SwiftUI

struct PressButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(background)
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
        }
        .frame(height: 48)
    }
}

struct PressButton_Previews: PreviewProvider {
    static var previews: some View {
        PressButton(title: "Value",
                    background: .blue) {
            /// Action
        }
    }
}
