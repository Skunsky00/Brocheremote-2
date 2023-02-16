//
//  UploadPostViewModel.swift
//  Broche
//
//  Created by Jacob Johnson on 2/15/23.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    
    func uploadPost(caption: String, image: UIImage) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            let data = ["caption": caption,
                        "timestamp": Timestamp(date: Date()),
                        "likes": 0,
                        "imageUrl":imageUrl,
                        "ownerUid": user.id ?? "",
                        "ownerImageUrl": user.profileImageUrl,
                        "ownerUsername": user.username] as [String : Any]
            
            COLLECTION_POST.addDocument(data: data) { _ in
                print("DEBUG: Upload post")
            }
        }
    }
}
