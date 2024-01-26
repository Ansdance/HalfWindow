//
//  DFFloatingPanelNavBar.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on 26.01.2024.
//  Copyright © 2024 ANSAR DAULETBAYEV. All rights reserved.
//

import UIKit

final class DFFloatingPanelNavBar: UIView {
    
    var navigationTitle: String? {
        didSet {
            self.navigationTitleLabel.text = navigationTitle
        }
    }
    
    var rightBarButtonIcon: String? {
        didSet {
            self.rightBarButton.setImage(UIImage(named: rightBarButtonIcon ?? ""), for: .normal)
        }
    }
    
    var dissmiss: (() -> (Void))?
    var rightBarButtonAction: (() -> (Void))?
    
    //MARK: - View
    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var sliderView: UIView = {
        let view = UIView()
        view.alpha = 0.24
        view.layer.backgroundColor = UIColor.gray.cgColor
        view.layer.cornerRadius = 4
        return view
    }()
    
    private lazy var backIconImageView: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.addTarget(self, action: #selector(dissmissBack), for: .touchUpInside)
        return button
    }()
    
    private lazy var rightBarButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(righBarButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var navigationTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.149, green: 0.157, blue: 0.259, alpha: 1)
        label.font = UIFont(name: "EuclidCircularB-Medium", size: 16)
        return label
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
        [topView].forEach {
            addSubview($0)
        }
        
        [sliderView,
         backIconImageView,
         navigationTitleLabel,
         rightBarButton
        ].forEach {
            topView.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height/13)
        }
        
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
        
        rightBarButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(16)
            make.size.equalTo(24)
        }
        
        navigationTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
    }
    
    @objc private func dissmissBack() {
        dissmiss?()
    }
    
    @objc private func righBarButtonAction() {
        rightBarButtonAction?()
    }
}
