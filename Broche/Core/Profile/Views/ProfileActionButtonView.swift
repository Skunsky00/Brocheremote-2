//
//  ProfileActionButtonView.swift
//  Broche
//
//  Created by Jacob Johnson on 12/14/22.
//

import SwiftUI

struct ProfileActionButtonView: View {
    let isCurrentUser: Bool
    var isFollowed = false
    
    var body: some View {
        if isCurrentUser {
            Button {} label: {
                Text("Edit Profile")
                    .font(.system(size: 15, weight: .semibold))
                    .frame(width: 160, height: 32)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
        }else {
            HStack {
                Button {} label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 160, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.teal)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth:isFollowed ? 1 : 0)
                        )
                }.cornerRadius(3)
                
                Button {} label: {
                    Image(systemName: "figure.wave")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 40, height: 32)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
            }
        }
    }
}

