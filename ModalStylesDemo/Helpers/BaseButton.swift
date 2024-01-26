//
//  BaseButton.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on 26.01.2024.
//  Copyright © 2024 Russell Archer. All rights reserved.
//

import UIKit

class BaseButton: UIButton, ViewProtocol {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        commonInit()
        setupStyle()
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() { }
    
    func setupStyle() { }
    
    func addSubviews() { }
    
    func makeConstraints() { }
}
