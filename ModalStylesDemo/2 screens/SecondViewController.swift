//
//  SecondViewController.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on 13.02.2024.
//  Copyright © 2024 Russell Archer. All rights reserved.
//

import UIKit
import SnapKit

// Протокол для передачи выбранных имен с второго экрана на первый
protocol SecondViewControllerDelegate: AnyObject {
    func didSelectNames(names: [String])
}

// Класс для второго экрана
class SecondViewController: UIViewController {
    weak var delegate: SecondViewControllerDelegate?
    let names = ["Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace"]
    var selectedNames: [String] = []

    // Создание таблицы для отображения списка имен
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()

    // Функция вызывается после загрузки экрана
    override func viewDidLoad() {
        super.viewDidLoad()
        // Устанавливаем цвет фона экрана
        view.backgroundColor = .white
        // Добавляем таблицу на экран
        view.addSubview(tableView)
        // Устанавливаем расположение таблицы на экране
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }

        // Создаем кнопку "Done" и устанавливаем действие при нажатии на нее
        let doneButton = UIButton()
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.blue, for: .normal)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        // Добавляем кнопку на экран
        view.addSubview(doneButton)
        // Устанавливаем расположение кнопки "Done" на экране
        doneButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
    }

    // Обработчик нажатия кнопки "Done"
    @objc func doneButtonTapped() {
        // Вызываем метод делегата для передачи выбранных имен на первый экран
        delegate?.didSelectNames(names: selectedNames)
        // Закрываем текущий экран
        dismiss(animated: true, completion: nil)
    }
}

// Расширение класса SecondViewController для обработки таблицы с именами
extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    // Функция для определения количества ячеек в таблице
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    // Функция для настройки отображения ячеек в таблице
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        // Проверяем, выбрано ли имя, и устанавливаем соответствующий стиль ячейки
        if selectedNames.contains(names[indexPath.row]) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }

    // Функция вызывается при выборе ячейки в таблице
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
           let selectedName = names[indexPath.row]
           // Проверяем, выбрано ли имя, и добавляем или удаляем его из списка выбранных имен
           if selectedNames.contains(selectedName) {
               selectedNames.removeAll(where: { $0 == selectedName })
           } else {
               selectedNames.append(selectedName)
           }
           // Обновляем отображение ячейки
           tableView.reloadRows(at: [indexPath], with: .automatic)
       }
   }
