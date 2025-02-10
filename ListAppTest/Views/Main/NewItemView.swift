//
//  NewItemView.swift
//  ListAppTest
//
//  Created by Andrii Marchuk on 28.01.2025.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    @State private var text = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        Spacer()
        
        VStack {
            
            TextField("What would you like to do?", text: $viewModel.title, axis: .vertical)
                .focused($isFocused)
                .textFieldStyle(.automatic)
                .lineLimit(8)
            
            DatePicker("Due Date", selection: $viewModel.dueDate)
                .datePickerStyle(.automatic)
            
            HStack {
                Spacer()
                
                Button {
                    if viewModel.canSaveItem {
                        viewModel.saveNewItem()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .trailing)
                        .foregroundStyle(.indigo)
                }
            }
            
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and select a due date of today or later."))
            }
        }
        .padding()
        .onAppear {
            isFocused = true
        }
    }
}



#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
