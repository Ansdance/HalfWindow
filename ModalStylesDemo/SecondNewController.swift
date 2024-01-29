//
//  SecondNewController.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on 26.01.2024.
//  Copyright © 2024 ANSAR DAULETBAYEV. All rights reserved.
//

import UIKit

class SecondNewController: UIViewController {
    
    //    lazy var notesLabel: UILabel = {
    //        let label = UILabel()
    //        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sem fringilla ut morbi tincidunt augue interdum. \n\nUt morbi tincidunt augue interdum velit euismod in pellentesque massa. Pulvinar etiam non quam lacus suspendisse faucibus interdum posuere. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci a. Eget nullam non nisi est sit amet. Odio pellentesque diam volutpat commodo. Id eu nisl nunc mi ipsum faucibus vitae.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sem fringilla ut morbi tincidunt augue interdum. Ut morbi tincidunt augue interdum velit euismod in pellentesque massa."
    //        label.font = .systemFont(ofSize: 16)
    //        label.textColor = .darkGray
    //        label.numberOfLines = 0
    //        return label
    //    }()
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        setupView()
    //        setupConstraints()
    //        navigationItem.hidesBackButton = true
    //
    //
    //        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonTapped))
    //        navigationItem.leftBarButtonItem = backButton
    //    }
    //
    //    func setupView() {
    //        view.backgroundColor = .white
    //    }
    //
    //    func setupConstraints() {
    //        view.addSubview(notesLabel)
    //
    //        notesLabel.snp.makeConstraints { make in
    //            make.top.bottom.leading.trailing.equalToSuperview()
    //        }
    //    }
    //
    //    @objc func backButtonTapped() {
    //        navigationController?.popViewController(animated: true)
    //    }
    //
    //}
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupViews()
        setupConstraints()
    }

    
    private lazy var sliderView: UIView = {
        let view = UIView()
        view.alpha = 0.24
        view.layer.backgroundColor = UIColor.gray.cgColor
        view.layer.cornerRadius = 4
        return view
    }()
    
    private func setupViews() {

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(dismissBack))
        UIBarButtonItem.appearance().tintColor = .black
        
        view.addSubview(sliderView)
    }
    
    private func setupConstraints() {
        
        sliderView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(6)
            make.centerX.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(4)
        }
    }
    
    
    @objc func dismissBack() {
        navigationController?.popViewController(animated: true)
    }
}
