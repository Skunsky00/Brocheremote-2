//
//  CustomSecureField.swift
//  Broche
//
//  Created by Jacob Johnson on 12/15/22.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let paceholder: Text
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                paceholder.foregroundColor(Color(.init(white: 1,alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
            }
        }
    }
}

    
