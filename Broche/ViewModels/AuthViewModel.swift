//
//  AuthViewModel.swift
//  Broche
//
//  Created by Jacob Johnson on 12/20/22.
//

import SwiftUI
import Firebase


class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login failed \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
  //      guard let image = image else { return }
        
   //     ImageUploader.uploadImage(image: image) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard let user = result?.user else { return }
                self.userSession = user
                print("Successfully registgered user...")
                
                let data = ["email": email,
                            "username": username,
                            "fullname": fullname,
     //                       "profileImageUrl": imageUrl,
                            "uid": user.uid]
                
                Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                   print("Successfully registgered user data...")
                    self.userSession = user
                }
            }
        }
 //   }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        
    }
}
