//
//  AddPostImage.swift
//  Broche
//
//  Created by Jacob Johnson on 12/17/22.
//

import SwiftUI
import PhotosUI

struct AddPostImage: View {
    let imageState: ProfileModel.ImageState
    
    var body: some View {
        switch imageState {
        case .success(let image):
            image.resizable()
        case .loading:
            ProgressView()
        case .empty:
            Image(systemName: "plus")
                .font(.system(size: 40))
                .foregroundColor(.white)
        case .failure:
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
        }
    }
}

struct PostImageFrame: View {
    let imageState: ProfileModel.ImageState
    var body: some View {
        AddPostImage(imageState: imageState)
            .scaledToFill()
            .clipped()
            .frame( height: 100)
            .background {
      //         Circle().fill(
                    LinearGradient(
                        colors: [.cyan, .green],
                        startPoint: .top,
                        endPoint: .bottom
                    )}
                
            
    }
}

struct EditableAddPostImage: View {
    @ObservedObject var viewModel: ProfileModel
    
    var body: some View {
        PostImageFrame(imageState: viewModel.imageState)
            .overlay(alignment: .bottomTrailing) {
                PhotosPicker(selection: $viewModel.imageSelections,
                             maxSelectionCount: 10,
                             matching: .any(of: [.videos, .images]),
                             photoLibrary: .shared()) {
                    Image(systemName: "pencil.circle.fill")
                        .symbolRenderingMode(.multicolor)
                        .font(.system(size: 30))
                        .foregroundColor(.accentColor)
                }
                .buttonStyle(.borderless)
            }
    }
}
