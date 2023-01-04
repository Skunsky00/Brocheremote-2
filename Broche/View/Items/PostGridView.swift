//
//  PostGridView.swift
//  Broche
//
//  Created by Jacob Johnson on 12/13/22.
//

import SwiftUI

struct PostGridView: View {
    private let items = [GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 2
    var body: some View {
        LazyVGrid(columns: items, spacing: 2, content: {
            ForEach(0..<6) { _ in
                NavigationLink(
                    destination: FeedView(),
                    label: {
                        ZStack {
                            
                            Image("exampleimage")
                                .resizable()
                                .scaledToFill()
                                .frame(width: width, height: width)
                                .clipped()
                            
                                Text("Nashville, TN")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 8)
                                    .padding(.top, 140)
                                    .font(.system(size:18, weight: .bold))
                                    .foregroundColor(.white)
                        }
                            
                    })
            }
        })
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
