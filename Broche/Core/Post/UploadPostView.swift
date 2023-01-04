//
//  Messages.swift
//  Broche
//
//  Created by Jacob Johnson on 12/10/22.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @StateObject var viewsModel = ProfileModel()
    var body: some View {
        NavigationStack {
            VStack {
                
                if postImage == nil {
                    TabView {
                        ForEach(0..<viewsModel.images.count, id: \.self) { index in
                            viewsModel.images[index]
                                .resizable()
                                .scaledToFit()
                                .frame(height: 400)
                        }
                    }
                    .tabViewStyle(.page)
                    .frame(height: 400)
                   
                    
                    AddPostForm()
                        
                                 
                    
                } else {
                    HStack(alignment: .bottom) {
                        Image("exampleimage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 96, height: 96)
                            .clipped()
                        
                        TextField("Enter your Caption", text: $captionText)
                    }.padding()
                }
                
                
                
            }
        }
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}


struct AddPostForm: View {
    @StateObject var viewModel = ProfileModel()
    
    var body: some View {
      //  Form {
           // Section {
                
        EditableAddPostImage(viewModel: viewModel)
                    
                
           // }
    //   }
    }
    
}
