//
//  ProfileView2.swift
//  Broche
//
//  Created by Jacob Johnson on 12/14/22.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModle: ProfileViewModel
    
    var body: some View {
        VStack {
            KFImage(URL(string: viewModle.user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 84, height: 84)
                .clipShape(Circle())
            
            Text(viewModle.user.fullname)
                .font(.system(size: 15, weight: .semibold))
                .padding(.vertical, 6)
            
            HStack(spacing: 24) {
                
                UserStatView(value: 2, title: "Followers")
                UserStatView(value: 4, title: "Following")
                
            }.padding(.vertical, 4)
            
            ProfileActionButtonView(viewModel: viewModle)
            
            Text("Creator of creator of broche")
                .font(.system(size: 15))
                .padding(.vertical, 6)
            
            
            
            
        }.padding(.top)
    }
}




