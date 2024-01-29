//
//  CustomActionButton.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on 26.01.2024.
//  Copyright © 2024 ANSAR DAULETBAYEV. All rights reserved.
//

import UIKit
import SnapKit

protocol ActionsDelegate: AnyObject {
    func createCard()
}


class CustomActionButton: BaseView {
    
    weak var delegate: ActionsDelegate?
    var titleLabel: String?
    
    let backgroundSize: CGFloat = 32.0
    let imageSize: CGFloat = 22.0
    let spacingBackground: CGFloat = 12.0
    let spacingImage: CGFloat = 17.0
    let chevronSize: CGFloat = 20.0
    
    
    private lazy var createButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.setTitle("Upload Document", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor(red: 0.149, green: 0.157, blue: 0.259, alpha: 0.12).cgColor
        button.addTarget(self, action: #selector(addDocumentButtonDidTap), for: .touchUpInside)
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 56, bottom: 0, right: 0)
        return button
    } ()
    
    private lazy var backgroundImageView: UIView = {
        let backgroundView = UIView()
        backgroundView.layer.cornerRadius = 8
        backgroundView.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.99, alpha: 1.0)
        return backgroundView
    } ()
    
    
    fileprivate lazy var imageView: UIImageView = {
        let imageIcon = UIImageView(image: UIImage(named: "documentTemplate"))
        imageIcon.contentMode = .scaleAspectFit
        imageIcon.layer.cornerRadius = 8
        return imageIcon
    }()
    
    @objc private func addDocumentButtonDidTap() {
        delegate?.createCard()
        print("Button tapped!")
    }
    
    //        init(title: String, action: () ->  Void) {
    //            super.init(frame: .zero)
    //            titleLabel = title
    //        }
    //
    //    required init?(coder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    override func addSubviews() {
        addSubview(createButton)
        createButton.addSubview(backgroundImageView)
        createButton.addSubview(imageView)
    }
    
    override func makeConstraints() {
        createButton.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(spacingImage)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(imageSize)
        }
        backgroundImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(spacingBackground)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(backgroundSize)
        }
    }
}
