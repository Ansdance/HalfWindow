//
//  UIView+Layouts.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on 07.02.2024.
//  Copyright © 2024 Russell Archer. All rights reserved.
//

import UIKit

extension UIView {

    @discardableResult
    func top(_ space: CGFloat = 0, to: NSLayoutAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        let layout = self.topAnchor.constraint(equalTo: to, constant: space)
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func leading(_ space: CGFloat = 0, to: NSLayoutAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        let layout = self.leadingAnchor.constraint(equalTo: to, constant: space)
        layout.isActive = true
        return layout
    }

    @discardableResult
    func trailing(_ space: CGFloat = 0, to: NSLayoutAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        let layout = self.trailingAnchor.constraint(equalTo: to, constant: space)
        layout.isActive = true
        return layout
    }

    @discardableResult
    func bottom(_ space: CGFloat = 0, to: NSLayoutAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        let layout = self.bottomAnchor.constraint(equalTo: to, constant: space)
        layout.isActive = true
        return layout
    }

    @discardableResult
    func centerY(_ space: CGFloat = 0, to: NSLayoutAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        let layout = self.centerYAnchor.constraint(equalTo: to, constant: space)
        layout.isActive = true
        return layout
    }

    @discardableResult
    func centerX(_ space: CGFloat = 0, to: NSLayoutAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint {
        let layout = self.centerXAnchor.constraint(equalTo: to, constant: space)
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func height(_ space: CGFloat) -> NSLayoutConstraint {
        let layout = self.heightAnchor.constraint(equalToConstant: space)
        layout.isActive = true
        return layout
    }
    
    @discardableResult
    func width(_ space: CGFloat) -> NSLayoutConstraint {
        let layout = self.widthAnchor.constraint(equalToConstant: space)
        layout.isActive = true
        return layout
    }
    
    func size(_ size: CGSize) {
        self.height(size.height)
        self.width(size.width)
    }
}
