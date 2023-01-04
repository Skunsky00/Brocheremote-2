//
//  LocationSearchActiveView.swift
//  Broche
//
//  Created by Jacob Johnson on 12/19/22.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack {
            
            Image(systemName: "mappin")
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            
            Text("Search Destination.")
                .foregroundColor(Color(.darkGray))
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.white)
                .shadow(color: .black, radius: 6)
            
                
        )
    }
}

struct LocationSearchActivationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActivationView()
    }
}
