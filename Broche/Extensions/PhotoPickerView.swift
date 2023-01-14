//
//  PhotoPickerView.swift
//  Broche
//
//  Created by Jacob Johnson on 12/14/22.
//

import SwiftUI
import PhotosUI

struct PhotoPickerView: View {
    @StateObject var photoPicker = PhotoPicker()
    @State var captionText = ""
    var body: some View {
        NavigationStack {
            VStack {
                if !photoPicker.images.isEmpty {
                    GeometryReader {
                        let size = $0.size
                        TabView {
                            ForEach(0..<photoPicker.images.count, id: \.self) { index in
                                photoPicker.images[index]
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .scaledToFill()
                                    .frame(width: size.width, height: size.height)
                                   // .frame(width: 400, height:500)
                                    .clipped()
                            }
                        }
                        .tabViewStyle(.page)
                        .frame(height: 400)
                    }
                    TextField("Enter your caption..", text: $captionText)
                        .padding()
                    
                    Button(action: {}, label:{ Text("Share")
                        .font(.system(size:16, weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)})
                    .padding()
                
                }
                else {
                    Text("Add Media")
                    .padding(.top)
                    
                }
                
                Spacer()
                
                PhotosPicker(
                    selection: $photoPicker.imageSelections,
                    maxSelectionCount: 10,
                    matching: .any(of: [.videos, .images]),
                    photoLibrary: .shared()) {
                        Image("addphoto")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    }
                
                
            }
        }
    }
}

struct PhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerView()
    }
}
