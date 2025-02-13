//
//  ListItemView.swift
//  ListAppTest
//
//  Created by Andrii Marchuk on 31.01.2025.
//

import SwiftUI

struct ListItemView: View {
  @StateObject var viewModel = ListItemViewModel()
  let item: ItemModel
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(item.title)
          .lineLimit(1)
        Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
          .font(.footnote)
          .foregroundStyle(.gray)
      }
      
      Spacer()
      
      Button {
        viewModel.toggleIsDone(item: item)
      } label: {
        Image(systemName: item.isDone ? "checkmark.circle" : "circle")
          .foregroundStyle(.indigo)
      }
    }
  }
}

#Preview {
  ListItemView(item: .init(id: "userId", title: "Get title", dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: false))
}
