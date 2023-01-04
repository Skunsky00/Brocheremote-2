//
//  BrochesRowView.swift
//  Broche
//
//  Created by Jacob Johnson on 12/12/22.
//

import SwiftUI

struct BrochesRowView: View {
    @State var likes = 0
    @State var likeImageName = "heart"
    @State var likeImageColor = Color.black
    
    var body: some View {
        
        
        // Broche post
        VStack(alignment: .leading) {
            
            //user profile and username and location
            HStack {
                Button(action: {
                    // action goes here..
                }, label: {
                    Image(systemName: "mappin.circle")
                        .font(.subheadline)
                        .imageScale(.large)
                        .foregroundColor(.black)
                    
                    Text("Mt.Juiet, TN")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                })
                
                Spacer()
                
                Button(action: {
                    //profile page
                },
            label: {
                Text("Johnson6")
                    .foregroundColor(.black)
                    .font(.footnote)
                    .bold()
                
                Image("exampleimage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
                
                   })
                
               }
            .padding(.horizontal,6 )
            
            //image
            Image("exampleimage")
                .resizable()
                .scaledToFill()
                .frame( height: 400)
                .clipped()
            
            //action buttons
            HStack(spacing: 16) {
                Button {
                    likes = likes + 1
                    likeImageColor = Color.red
                    likeImageName = "heart.fill"
                } label: {
                    Image(systemName: likeImageName)
                        .font(.system(size:15, weight: .semibold))
                        .imageScale(.large)
                        .foregroundColor(likeImageColor)
                }
            Button {
                    //save to favorites
                } label: {
                    Image(systemName: "bookmark")
                        .font(.system(size:15, weight: .semibold))
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                Button {
                    //comment on post
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.system(size:15, weight: .semibold))
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                Button {
                    //settings on post
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.system(size:15, weight: .semibold))
                        .imageScale(.large)
                        .foregroundColor(.black)
                }

            }
            .padding(.horizontal, 10)
            .padding(.top, 3)
            
            //likes and comments lable
            HStack {
                    Text("\(likes) likes")
                        .font(.system(size: 14, weight: .semibold))
                        .fontWeight(.semibold)
                    
                       Spacer()
                
                    Text("0 comments")
                        .font(.system(size: 14, weight: .semibold))
                        .fontWeight(.semibold)
                
                  }
            .padding(.horizontal, 12)
            .padding(.bottom, 1)
            
            // caption - broche description
            HStack {
                Text("Johnson6")
                    .font(.system(size :14, weight: .semibold)) +
                    Text(" Billionare. International playboy. Philanthropist")
                    .font(.system(size: 15))
            }.padding(.leading, 8)
                
                Text("2d")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
                    .padding(.top, -2)
                
            
            Divider()
        }
    }
}

struct BrochesRowView_Previews: PreviewProvider {
    static var previews: some View {
        BrochesRowView()
    }
}
