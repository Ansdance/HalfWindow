//
//  DFFloatingPanelNavBar.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on 26.01.2024.
//  Copyright © 2024 ANSAR DAULETBAYEV. All rights reserved.
//

import UIKit

final class DFFloatingPanelNavBar: UIView {

    var dismiss: (() -> (Void))?

    private lazy var sliderView: UIView = {
        let view = UIView()
        view.alpha = 0.24
        view.layer.backgroundColor = UIColor.gray.cgColor
        view.layer.cornerRadius = 4
        return view
    }()
    //Create document
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
        addSubview(sliderView)
        addSubview(backIconImageView)
    }
    
    private func makeConstraints() {

        sliderView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(6)
            make.centerX.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(4)
        }
        
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
