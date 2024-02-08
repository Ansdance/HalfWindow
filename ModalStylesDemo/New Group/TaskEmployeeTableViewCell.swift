//
//  TaskEmployeeTableViewCell.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on 08.02.2024.
//  Copyright © 2024 Russell Archer. All rights reserved.
//

import UIKit
import SnapKit

class TaskEmployeeTableViewCell: UITableViewCell {
    // UI элементы для отображения данных о сотруднике
    private let employeeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let jobTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // Добавляем UI элементы к ячейке
        addSubview(employeeImageView)
        addSubview(nameLabel)
        addSubview(jobTitleLabel)
        
        // Устанавливаем ограничения с использованием SnapKit
        employeeImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalTo(employeeImageView.snp.right).offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        jobTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.left.equalTo(nameLabel)
            make.right.equalToSuperview().offset(-16)
            make.bottom.lessThanOrEqualToSuperview().offset(-8)
        }
    }
    
    // Метод для настройки ячейки с данными TaskEmployeeModel
    func configure(with employee: TaskEmployeeModel) {
        nameLabel.text = "\(employee.firstName ?? "") \(employee.lastName ?? "")"
        jobTitleLabel.text = employee.jobTitle
        
        // Загрузка изображения по URL, можно реализовать с использованием Kingfisher или подобной библиотеки
        // employeeImageView.kf.setImage(with: URL(string: employee.photoUrl ?? ""))
    }
}
