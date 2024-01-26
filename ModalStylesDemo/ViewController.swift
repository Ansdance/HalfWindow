//
//  ViewController.swift
//  ModalStylesDemo
//
//  Created by Russell Archer on 30/09/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    //    fileprivate var selectedPresentationStyle: UIModalPresentationStyle = .automatic
    
    /*
     
     presentViewController vs pushViewController
     -------------------------------------------
     
     presentViewController:
     
     * The new view controller is presented MODALLY
     * The new view controller is NOT added to the existing navigation stack (it's not contained by the nav controller)
     * You DO NOT get a navigation bar and back button
     * modalPresentationStyle == .automatic:
     
     * Presents the new view controller on top of the current view controller
     * The top of current view controller can be seen “underneath” the new view controller
     * The user can dismiss the new view controller by dragging down
     * As it's not part of the navigation stack, there is no navigation bar
     
     * modalPresentationStyle == .fullscreen:
     
     * Presents the new view controller on top of the current view controller
     * The current view controller CANNOT be seen underneath the new view controller
     * There is no way for the user dismiss the new view controller
     * As it's not part of the navigation stack, there is no navigation bar (the user is "stuck")
     * New view controller should provide a "Done" button to allow user to dismiss it
     
     pushViewController:
     
     * Pushes the new view controller onto the EXISTING navigation stack
     * The new vc is NOT presented modally
     * The new view controller is always presented full screen (it's indepedent of modalPresentationStyle)
     * You automatically get a navigation bar and back button
     
     */
    
    lazy var contentStackView: UIStackView = {
        let spacer = UIView()
        let stackView = UIStackView(arrangedSubviews: [registerButton])
        stackView.axis = .vertical
        stackView.spacing = 12.0
        return stackView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
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
        //        setupView()
        setupConstraints()
        view.backgroundColor = .white
        registerButton.addTarget(self, action: #selector(presentModalController), for: .touchUpInside)
    }
    
    func setupView() {
        view.backgroundColor = .white
    }
    
    func setupConstraints() {
        view.addSubview(containerView)
        containerView.addSubview(contentStackView)

        
        containerView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
            make.width.equalToSuperview().inset(32)
        }
        
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)  
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(50)
        }
        
    }
    
    @objc func presentModalController() {
        let vc = NewViewController()
        
        vc.transitioningDelegate = self
        
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
