//
//  Notifications.swift
//  Broche
//
//  Created by Jacob Johnson on 12/10/22.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 12) {
                ForEach(0 ..< 20) {  _ in
                   NotificationCell()
                        .padding(.top)
                }
            }
        }
    }
}

struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
