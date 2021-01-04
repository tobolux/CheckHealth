//
//  DarkMode.swift
//  CheckHealth
//
//  Created by Ilya Bolotov on 23.12.2020.
//

import UIKit

extension UIColor {
    
    static let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if #available(iOS 13, *) {
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor(named: "Background") ?? .systemGray5
        } else {
            return UIColor(named: "Background") ?? .white
        }
        }
        return UIColor(named: "Background") ?? .white
    }
    
    static let dynamicColorHeader = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        if #available(iOS 13, *) {
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor(named: "BackgroundHeader") ?? .systemGray2
        } else {
            return UIColor(named: "BackgroundHeader") ?? .systemTeal
        }
        }
        return UIColor(named: "BackgroundHeader") ?? .systemTeal
    }
    
    
}




