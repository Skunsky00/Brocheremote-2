//
//  ImagePickerView.swift
//  Broche
//
//  Created by Jacob Johnson on 12/14/22.
//
import PhotosUI
import SwiftUI

struct ImagePickerView2: View {
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    
    var body: some View {
        VStack {
            if let data = data, let uiimage = UIImage(data: data) {
                Image(uiImage: uiimage)
                    .resizable()
            }
            
            PhotosPicker(
                selection: $selectedItems,
                maxSelectionCount: 10,
                matching: .any(of: [.videos, .images])
                
            ) {
                Image("addphoto")
            }
            .onChange(of: selectedItems) { newValue in
                guard let item = selectedItems.first else {
                    return
                }
                item.loadTransferable(type: Data.self) { result in
                    switch result {
                    case .success(let data):
                        if let data = data{
                            self.data = data
                        } else{
                            print("data is nil")
                        }
                    case .failure(let failure):
                        fatalError("\(failure)")
                    }
                }
            }
            Spacer()
        }
    }
}


struct ImagePickerView2_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView2()
    }
}
