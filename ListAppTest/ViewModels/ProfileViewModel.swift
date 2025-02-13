//
//  ProfileViewViewModel.swift
//  ListAppTest
//
//  Created by Andrii Marchuk on 28.01.2025.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation


class ProfileViewModel: ObservableObject {
    @Published var user: UserModel? = nil
    
    init() {
        
    }
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
                    
            DispatchQueue.main.async {
                self.user = UserModel(id: data["id"] as? String ?? "",
                                      username: data["username"] as? String ?? "",
                                      email: data["email"] as? String ?? "",
                                      timeJoined: data["timeJoined"] as? TimeInterval ?? 0)
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
