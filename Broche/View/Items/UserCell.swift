//
//  UserCell.swift
//  Broche
//
//  Created by Jacob Johnson on 12/13/22.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("exampleimage")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            //vsatck -> username
            VStack(alignment: .leading) {
                Text("Johnson6")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("William Johnson")
                    .font(.system(size: 14))
                
            }
           Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
