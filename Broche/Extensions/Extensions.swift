//
//  Extensions.swift
//  Broche
//
//  Created by Jacob Johnson on 12/13/22.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
