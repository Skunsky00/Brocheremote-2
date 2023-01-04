//
//  UserListView.swift
//  Broche
//
//  Created by Jacob Johnson on 12/13/22.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack{
                ForEach(0 ..< 20) { _ in
                    NavigationLink(
                        destination: ProfileView2(),
                        label: {
                            UserCell()
                                .padding(.leading)
                    })
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
