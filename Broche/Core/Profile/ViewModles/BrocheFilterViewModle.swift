//
//  BrocheFilterViewModle.swift
//  Broche
//
//  Created by Jacob Johnson on 12/12/22.
//

import Foundation

enum BrocheFilterViewModel: Int, CaseIterable {
    case heart
    case bookmark
   
    
    var title: String {
        
        switch self {
            
        case .heart: return "Heart"
        case .bookmark: return "Bookmark"
        
        }
    }
}
        



