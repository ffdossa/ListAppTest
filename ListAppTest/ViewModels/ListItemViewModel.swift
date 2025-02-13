//
//  ListItemViewViewModel.swift
//  ListAppTest
//
//  Created by Andrii Marchuk on 31.01.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ListItemViewModel: ObservableObject {
    
    init () {
        
    }
    
    func toggleIsDone(item: ItemModel) {
        var itemCopy = item
        itemCopy.toggleDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("itemsList")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
