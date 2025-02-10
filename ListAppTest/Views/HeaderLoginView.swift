//
//  HeaderLoginView.swift
//  ListAppTest
//
//  Created by Andrii Marchuk on 29.01.2025.
//

import SwiftUI

struct HeaderLoginView: View {
  let title: String
  let subtittle: String
  let color: Color

  var body: some View {
    VStack {
      Text(title)
        .bold()
        .font(.title)
        .foregroundStyle(color)

      Text(subtittle)
        .font(.footnote)
        .foregroundStyle(color)
    }
    .frame(height: 120)
    .padding(.top, 80)

    Spacer()
  }
}

#Preview {
  HeaderLoginView(title: "Title", subtittle: "Subtitle", color: Color.indigo)
}
