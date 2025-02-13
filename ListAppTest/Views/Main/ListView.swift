//
//  ListView.swift
//  ListAppTest
//
//  Created by Andrii Marchuk on 28.01.2025.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ListView: View {
  @StateObject var viewModel: ListViewModel
  @FirestoreQuery var items: [ItemModel]
  
  init(userId: String) {
    self._items = FirestoreQuery(collectionPath: "users/\(userId)/itemsList")
    self._viewModel = StateObject(wrappedValue: ListViewModel(userId: userId))
  }
  
  var body: some View {
    NavigationView {
      VStack {
        List(items) { item in
          ListItemView(item: item)
            .swipeActions {
              Button {
                viewModel.delete(id: item.id)
              } label: {
                Text("Delete")
              }
              .tint(.red)
            }
        }
        .listStyle(.plain)
        
        Spacer()
        
        HStack {
          Spacer()
          
          Button {
            viewModel.showingNewItemView = true
          } label: {
            Image(systemName: "plus.circle.fill")
              .resizable()
              .foregroundStyle(.indigo)
            
          }
          .frame(width: 60, height: 60)
          .padding()
        }
      }
      .navigationTitle("Tasks")
      
      .sheet(isPresented: $viewModel.showingNewItemView) {
        NewItemView(newItemPresented: $viewModel.showingNewItemView)
      }
    }
  }
}


#Preview {
  ListView(userId: "hg7VGDjKDdNWQdFCZpkRC8aWPw43")
}
