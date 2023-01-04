//
//  Broche Row View.swift
//  Broche
//
//  Created by Jacob Johnson on 12/10/22.
//

import SwiftUI

struct twitter_Row_View: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            // profile image + userinfo + broche post
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                // user info and broche post
                VStack(alignment: .leading, spacing: 4) {
                    //user info
                    HStack {
                        Text("William Johnson")
                            .font(.subheadline).bold()
                        
                        Text("@Johnson6")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    // broche caption
                    
                    Text("Worlds best Travel locations")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            // action buttons
            
            HStack {
                Button {
                    // action goes here..
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                    
                }
                
                Spacer()
                
                Button {
                    // action goes here..
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                    
                }
                
                Spacer()
                
                Button {
                    // action goes here..
                } label: {
                    Image(systemName: "arrow.right")
                        .font(.subheadline)
                    
                }
                
                Spacer()
                
                Button {
                    // action goes here..
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                    
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

struct twitter_Row_View_Previews: PreviewProvider {
    static var previews: some View {
        twitter_Row_View()
    }
}
