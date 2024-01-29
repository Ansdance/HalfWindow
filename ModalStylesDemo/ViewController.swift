//
//  ViewController.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on on 26.01.2024.
//  Copyright © 2024 ANSAR DAULETBAYEV. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next Page", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = view.tintColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        registerButton.addTarget(self, action: #selector(presentModalController), for: .touchUpInside)
    }
    
    func setupView() {
        view.backgroundColor = .white
    }
    
    func setupConstraints() {
        view.addSubview(registerButton)
        
        registerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    @objc func presentModalController() {
        let vc = NewViewController()
        
//        vc.transitioningDelegate = self
        
        let newNavigationController = UINavigationController(rootViewController: vc)
        newNavigationController.transitioningDelegate = self
        newNavigationController.modalPresentationStyle = .custom
        present(newNavigationController, animated: true, completion: nil)
        
    }
}


extension ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
