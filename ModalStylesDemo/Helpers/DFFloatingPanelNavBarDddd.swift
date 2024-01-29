//
//  DFFloatingPanelNavBarDddd.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on 28.01.2024.
//  Copyright © 2024 Russell Archer. All rights reserved.
//

import UIKit

final class DFFloatingPanelNavBarDddd: UIView {

    var dismiss: (() -> (Void))?

    private lazy var backIconImageView: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.addTarget(self, action: #selector(dissmissBack), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setup() {
        setupViews()
        makeConstraints()
    }
    
    private func setupViews() {
        
        addSubview(backIconImageView)
    }
    
    private func makeConstraints() {

        
        backIconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.leading.equalToSuperview().inset(16)
            make.size.equalTo(24)
        }
       
    }
    
    @objc private func dissmissBack() {
        dismiss?()
    }
    
}
