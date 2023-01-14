//
//  ProfileModel.swift
//  Broche
//
//  Created by Jacob Johnson on 12/17/22.
//

import SwiftUI
import PhotosUI
import CoreTransferable

@MainActor
class ProfileModel: ObservableObject {
    
    // MARK: - Profile Details
    @Published var image: Image?
    @Published var images: [Image] = []
    @Published var selectedImage: UIImage?
  
    
    // MARK: - Profile Image
    
    enum ImageState {
        case empty
        case loading(Progress)
        case success(Image)
        case failure(Error)
    }
    
    enum TransferError: Error {
        case importFailed
    }
    
    struct ProfileImage: Transferable {
        let image: Image
        
        static var transferRepresentation: some TransferRepresentation {
            DataRepresentation(importedContentType: .image) { data in
            #if canImport(AppKit)
                guard let nsImage = NSImage(data: data) else {
                    throw TransferError.importFailed
                }
                let image = Image(nsImage: nsImage)
                return ProfileImage(image: image)
            #elseif canImport(UIKit)
                guard let uiImage = UIImage(data: data) else {
                    throw TransferError.importFailed
                }
                let image = Image(uiImage: uiImage)
                return ProfileImage(image: image)
            #else
                throw TransferError.importFailed
            #endif
            }
        }
    }
    
    @Published private(set) var imageState: ImageState = .empty
    
    @Published var imageSelection: PhotosPickerItem? = nil {
        didSet {
            if let imageSelection {
                let progress = loadTransferable(from: imageSelection)
                imageState = .loading(progress)
            } else {
                imageState = .empty
            }
        }
    }
    
    @Published var imageSelections: [PhotosPickerItem] = [] {
        didSet {
            Task {
                if !imageSelections.isEmpty {
                    try await loadTransferable(from: imageSelections)
                    imageSelections = []
                }
            }
        }
    }
    
    
    func loadTransferable(from imageSelections: [PhotosPickerItem]) async throws {
        do {
            for imageSelection in imageSelections {
                if let data = try await imageSelection.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        self.images.append(Image(uiImage: uiImage))
                    }
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    // MARK: - Private Methods
    
    private func loadTransferable(from imageSelection: PhotosPickerItem) -> Progress {
        return imageSelection.loadTransferable(type: ProfileImage.self) { result in
            DispatchQueue.main.async {
                guard imageSelection == self.imageSelection else {
                    print("Failed to get the selected item.")
                    return
                }
                switch result {
                case .success(let profileImage?):
                    self.imageState = .success(profileImage.image)
                case .success(nil):
                    self.imageState = .empty
                case .failure(let error):
                    self.imageState = .failure(error)
                }
            }
        }
    }
}



