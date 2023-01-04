//
//  SwipeView.swift
//  Broche
//
//  Created by Jacob Johnson on 12/14/22.
//

import SwiftUI

struct SwipeView: View {
    private let colors: [Color] = [.red, .blue, .green]
    
    var body: some View {
        VStack {
            TabView {
                ForEach(colors, id: \.self) { color in
                    //   ZStack {
                    color
                    //   Text("\(color.description)")
                        .font(.title)
                        .foregroundColor(.white)
                    
                }
            }
            .tabViewStyle(.page)
            .frame(height: 100)
            
            Spacer()
        }
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
