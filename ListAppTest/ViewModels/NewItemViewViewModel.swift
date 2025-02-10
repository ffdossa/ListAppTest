//
//  NewItemViewViewModel.swift
//  ListAppTest
//
//  Created by Andrii Marchuk on 28.01.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() { }
    
    func saveNewItem() {
        guard canSaveItem else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newItem = ItemModel(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone: false)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("itemsList")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSaveItem: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
