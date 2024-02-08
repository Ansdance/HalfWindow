//
//  BottomsheetViewController.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on 07.02.2024.
//  Copyright © 2024 Russell Archer. All rights reserved.
//

import UIKit
 
class BottomsheetViewController: UIViewController {
    let outsideButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black.withAlphaComponent(0.25)
        
        return button
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        return view
    }()
    
    let topLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.16)
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [outsideButton, containerView, topLineView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        topLineView.top(6, to: containerView.topAnchor)
        topLineView.centerX(to: containerView.centerXAnchor)
        topLineView.height(4)
        topLineView.width(36)
        
        outsideButton.top(to: view.topAnchor)
        outsideButton.trailing(to: view.trailingAnchor)
        outsideButton.bottom(to: view.bottomAnchor)
        outsideButton.leading(to: view.leadingAnchor)
        
        containerView.trailing(to: view.trailingAnchor)
        containerView.bottom(to: view.bottomAnchor)
        containerView.leading(to: view.leadingAnchor)
        
        outsideButton.addTarget(self, action: #selector(dismissPage), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let containerViewFrame = containerView.frame
        containerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: containerViewFrame.width, height: containerViewFrame.height)
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.containerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - containerViewFrame.height, width: containerViewFrame.width, height: containerViewFrame.height)
        }
    }
    
    @objc
    func dismissPage() {
        closePage()
    }
    
    func closePage(onClose: (() -> ())? = nil) {
        let containerViewFrame = containerView.frame
        topLineView.isHidden = true
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.containerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: containerViewFrame.width, height: containerViewFrame.height)
        } completion: { [weak self] _ in
            self?.dismiss(animated: false)
            onClose?()
        }
    }
}
