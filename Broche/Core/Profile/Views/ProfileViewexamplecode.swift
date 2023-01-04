//
//  ProfileView.swift
//  Broche
//
//  Created by Jacob Johnson on 12/10/22.
//

import SwiftUI

// grid layout for profile page

struct ProfileViewexamplecode: View {
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0 ..< 50, id: \.self) { index in
                    Rectangle()
                        .frame(height: 50)
                }
            }
        }
    }
}

struct ProfileViewexamplecode_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
