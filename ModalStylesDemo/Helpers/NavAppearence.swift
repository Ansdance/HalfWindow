//
//  NavAppearence.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on 29.01.2024.
//  Copyright © 2024 Russell Archer. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func setupNavBarColor() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        appearance.backgroundColor = .purple
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        self.navigationBar.tintColor = .white
        UIBarButtonItem.appearance().tintColor = .white
    }
}
