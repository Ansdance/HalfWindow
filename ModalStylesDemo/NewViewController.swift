//
//  NewViewController.swift
//  ModalStylesDemo
//
//  Created by Russell Archer on 01/10/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//

import UIKit
import SnapKit

class NewViewController: UIViewController {
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next222 Page", for: .normal)
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
        registerButton.addTarget(self, action: #selector(pushViewControllerTapped), for: .touchUpInside)
    }
    
    func setupView() {
        view.backgroundColor = .clear
    }
    
    func setupConstraints() {
        view.addSubview(registerButton)
       
        registerButton.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    
    @objc func pushViewControllerTapped() {
        let vc = SecondNewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
   
