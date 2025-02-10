//
//  ListViewViewModel.swift
//  ListAppTest
//
//  Created by Andrii Marchuk on 28.01.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("itemsList")
            .document(id)
            .delete()
    }
}
