//
//  ProfileFilterSelector.swift
//  Broche
//
//  Created by Jacob Johnson on 12/19/22.
//

import Foundation

enum ProfileFilterSelector: Int, CaseIterable {
    case hearts
    case bookmarks
    case mappin
    
    var imageName: String {
        switch self {
        case .hearts: return "heart.fill"
        case .bookmarks: return "bookmark.fill"
        case .mappin: return "mappin.circle.fill"
        }
    }
}
