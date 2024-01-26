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
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var navigationView: DFFloatingPanelNavBar = {
        let view = DFFloatingPanelNavBar()
        view.navigationTitle = "Create document"
        return view
    }()
     
    private lazy var customButton: UIView = {
        return CustomActionButton()//(title: "Upload Document")
    }()
    
    private lazy var secondButton: UIView = {
        return CustomActionButton()//(title: "Upload Document")
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(containerView)
        
        containerView.addSubview(navigationView)
        containerView.addSubview(customButton)
        containerView.addSubview(secondButton)
    }
    
    func setupConstraints() {

        containerView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        navigationView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(54)
        }
        
        customButton.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            
            make.height.equalTo(54)
        }
        
        secondButton.snp.makeConstraints { make in
            make.top.equalTo(customButton.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            
            make.height.equalTo(54)
        }
        
    }
    
    
    @objc func pushViewControllerTapped() {
        let vc = SecondNewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
   
extension NewViewController: ActionsDelegate {
    func createCard() {
//        viewModel.mutate(.generateCard)
    }
}
