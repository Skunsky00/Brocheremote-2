//
//  CustomTextField.swift
//  Broche
//
//  Created by Jacob Johnson on 12/15/22.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let paceholder: Text
    let imageName: String
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                paceholder.foregroundColor(Color(.init(white: 1,alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), paceholder: Text("Email"), imageName: "envelope")
    }
}
