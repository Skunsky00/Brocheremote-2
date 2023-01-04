//
//  FeedView.swift
//  Broche
//
//  Created by Jacob Johnson on 12/10/22.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(0 ... 20, id: \.self) { _ in
                  BrochesRowView()
                        
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
