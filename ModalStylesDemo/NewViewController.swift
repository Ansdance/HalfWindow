//
//  NewViewController.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on 26.01.2024.
//  Copyright © 2024 ANSAR DAULETBAYEV. All rights reserved.
//

import UIKit
import SnapKit

class NewViewController: UIViewController {
    
    private lazy var containerGeneralView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var containerNavigationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var containerForButtonsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var containerForSliderView: UIView = {
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
    
    private lazy var customButton: CustomActionButton = {
        let buttonD = CustomActionButton()
        buttonD.delegate = self
        return buttonD
    }()
    
    private lazy var secondButton: CustomActionButton = {
        let buttonDd = CustomActionButton()
        buttonDd.delegate = self
        return buttonDd
    }()
    
    private lazy var navigationLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваш текст здесь"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    func createCustomBarButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ios_arrow_left_regular"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
        let imageSize: CGFloat = 24
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16 - imageSize)

        button.contentEdgeInsets = UIEdgeInsets(top: 28, left: 0, bottom: 0, right: 0)
        
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()

        let customBarButton = UIBarButtonItem(customView: createCustomBarButton())
        self.navigationItem.leftBarButtonItem = customBarButton
    }
    
    func setupViews() {
        view.addSubview(containerGeneralView)
        
        containerGeneralView.addSubview(containerForSliderView)
        containerGeneralView.addSubview(containerNavigationView)
        containerGeneralView.addSubview(containerForButtonsView)
        
        containerForSliderView.addSubview(sliderView)
        
        containerForButtonsView.addSubview(customButton)
        containerForButtonsView.addSubview(secondButton)
    }
    
    func setupConstraints() {
        
        containerGeneralView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        containerForSliderView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(16)
        }
        
        containerNavigationView.snp.makeConstraints { make in
            make.top.equalTo(containerForSliderView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(48)
        }
        
        containerForButtonsView.snp.makeConstraints { make in
            make.top.equalTo(containerNavigationView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(144)
        }
        
        sliderView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(6)
            make.centerX.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(4)
        }
        
        customButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            
            make.height.equalTo(48)
        }
        
        secondButton.snp.makeConstraints { make in
            make.top.equalTo(customButton.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            
            make.height.equalTo(48)
        }
        
    }
    
    
    @objc func pushViewControllerTapped() {
        let vc = SecondNewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func dismissTapped() {
        dismiss(animated: true)
    }
}

extension NewViewController: ActionsDelegate {
    func createCard() {
        pushViewControllerTapped()
    }
}
