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
    //    var titleLabel: String?
    
    let backgroundSize: CGFloat = 32.0
    let imageSize: CGFloat = 22.0
    let spacingBackground: CGFloat = 12.0
    let spacingImage: CGFloat = 17.0
    let chevronSize: CGFloat = 20.0
    
    private lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.layer.cornerRadius = 12
        backgroundView.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.99, alpha: 1.0)
        return backgroundView
    }()
    
    private lazy var createButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.149, green: 0.157, blue: 0.259, alpha: 0.12).cgColor
        button.addTarget(self, action: #selector(addDocumentButtonDidTap), for: .touchUpInside)
        return button
    } ()
    
    fileprivate lazy var bundleTitle: UILabel = {
        let label = UILabel()
        label.text = "Upload Document"//titleLabel
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    fileprivate lazy var imageView: UIImageView = {
        let imageIcon = UIImageView(image: UIImage(named: "documentTemplate"))
        imageIcon.contentMode = .scaleAspectFit
        return imageIcon
    }()
    
    @objc private func addDocumentButtonDidTap() {
        delegate?.createCard()
    }
    
    //    init(title: String, action: () ->  Void) {
    //        super.init(frame: .zero)
    //        titleLabel = title
    //    }
    
    override func addSubviews() {
        addSubview(createButton)
        createButton.addSubview(backgroundView)
        createButton.addSubview(imageView)
        createButton.addSubview(bundleTitle)
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
        
        bundleTitle.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(spacingBackground)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(247)
        }
        
        backgroundView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
