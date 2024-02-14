//
//  FirstViewController.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on 13.02.2024.
//  Copyright © 2024 Russell Archer. All rights reserved.
//

import UIKit
import SnapKit

// Создаем класс для первого экрана, который является подклассом UIViewController
class FirstViewController: UIViewController {
    // Объявляем переменные для метки и кнопки
    let selectedNamesLabel = UILabel()
    let selectButton = UIButton()

    // Функция вызывается после загрузки экрана
    override func viewDidLoad() {
        super.viewDidLoad()
        // Устанавливаем цвет фона экрана
        view.backgroundColor = .white

        // Устанавливаем текст и действие кнопки "Select Names"
        selectButton.setTitle("Select Names", for: .normal)
        selectButton.setTitleColor(.blue, for: .normal)
        selectButton.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
        // Добавляем кнопку на экран
        view.addSubview(selectButton)
        
        // Устанавливаем количество строк для метки
        selectedNamesLabel.numberOfLines = 0
        // Добавляем метку на экран
        view.addSubview(selectedNamesLabel)
        
        // Вызываем функцию для установки расположения элементов на экране
        setupConstraints()
    }

    // Функция для установки расположения элементов на экране
    func setupConstraints() {
        // Устанавливаем центр кнопки "Select Names" в центре экрана
        selectButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        // Устанавливаем расположение метки в верхней части экрана с отступом от верхнего края и справа и слева
        selectedNamesLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }

    // Обработчик нажатия кнопки "Select Names"
    @objc func selectButtonTapped() {
        // Создаем экземпляр второго экрана
        let secondVC = SecondViewController()
        // Устанавливаем делегат для обработки выбранных имен на втором экране
        secondVC.delegate = self
        // Передаем выбранные имена с первого экрана на второй
        secondVC.selectedNames = selectedNamesLabel.text?.components(separatedBy: "\n").filter { !$0.isEmpty } ?? []
        // Отображаем второй экран
        present(secondVC, animated: true, completion: nil)
    }
}

// Расширение класса FirstViewController для обработки выбранных имен с второго экрана
extension FirstViewController: SecondViewControllerDelegate {
    // Функция вызывается при выборе имен на втором экране
    func didSelectNames(names: [String]) {
        // Обновляем метку на первом экране с выбранными именами
        selectedNamesLabel.text = names.joined(separator: "\n")
    }
}
