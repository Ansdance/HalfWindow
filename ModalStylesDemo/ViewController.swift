//
//  ViewController.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on on 26.01.2024.
//  Copyright © 2024 ANSAR DAULETBAYEV. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var initiators: [TaskEmployeeModel] = []
   
    var selectedInitiators: [TaskEmployeeModel] = []
    var unselectedInitiators: [TaskEmployeeModel] = []
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        
        tableView.reloadData()
        
        fetchDataFromAPI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(InitiatorCell.self, forCellReuseIdentifier: "InitiatorCell")
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            if section == 0 {
                return "Selected"
            } else {
                return "Unselected"
            }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return selectedInitiators.count
        } else {
            return unselectedInitiators.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InitiatorCell", for: indexPath) as! InitiatorCell
        let initiator = initiators[indexPath.row]
        cell.configure(with: initiator)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedInitiator = initiators[indexPath.row]
           
           if var currentSelected = selectedInitiator.selected {
               currentSelected.toggle()
               selectedInitiator.selected = currentSelected
           }
           
           initiators[indexPath.row] = selectedInitiator
           
           tableView.reloadRows(at: [indexPath], with: .none)
        
//        var selectedInitiator = initiators[indexPath.row]
//
//            if var currentSelected = selectedInitiator.selected {
//                currentSelected.toggle()
//                selectedInitiator.selected = currentSelected
//            }
//
//            initiators[indexPath.row] = selectedInitiator
//
//            moveSelectedInitiatorToTop(selectedInitiator)
    }
    
    private func moveSelectedInitiatorToTop(_ initiator: TaskEmployeeModel) {
            initiators.removeAll { $0.id == initiator.id }
          
            initiators.insert(initiator, at: 0)
            
            initiators.sort { (first, second) in
                if let firstSelected = first.selected, let secondSelected = second.selected {
                   
                    return firstSelected && !secondSelected
                } else if first.selected != nil {
                  
                    return true
                } else {
                   
                    return false
                }
            }
            
            tableView.reloadData()
    }

    
    private func fetchDataFromAPI() {
        guard let url = URL(string: "https://dms.dar-dev.zone/api/v1/route-api/hcms/employees/company?companyId=655b7bfb-ff67-4a81-a48f-89c054f188b7") else {
            print("Неверный URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiI1Y2Q0MmZjMy0xOWRiLTQ4OTUtYWVlMC04ZWI2ZGY2NThhM2MvMzY3Y2MyYzgtMmM2My00M2RlLTgzMDYtNDE1MTk3MDMzMDJiIiwiZXhwIjoxNzA3MzkyNzc3LCJpYXQiOjE3MDczMDYzNzcsImlzcyI6Imh0dHBzOi8vZ3JpZmZvbi5pbyIsInN1YiI6ImE1MDJlYjc0LTQzNDYtNDUyYi05MTg3LWY3MTE4NDZhNGRjYyIsIm5vbmNlIjoiODg5MGRlMzYtOGZhNy00YWIxLWFmODAtMDdiMWQzZTdkMDY3IiwiYWNyIjoib2F1dGgyIiwiYXpwIjoiMzY3Y2MyYzgtMmM2My00M2RlLTgzMDYtNDE1MTk3MDMzMDJiIiwiZW1haWwiOiJha3VhdGJla0BkYXIuaW8iLCJuYW1lIjoiICJ9.mfWrgK-4pZbW0YCqKTEhMfDOGMMFyRPWJP4kgj-K8v781RJo8uP6sn_umrKOhpDRZJZZeHyQXehBmFtoW_VapkPimS56B4RvnORE1134O7YfWERbxqX4ouGn82HXpb12ftGAL6fdzd-i4K84KzbtJfeFPesoDWrRjug-UY7MnQCyAobPSh-bSbAuMVNiMgCUAhtalZG9HKQfxOCLqJoc575zaQLdl7mcGZ_2Y8MiI3wUTisgtTZvRnEGXSg7NwhHIh3RbhR6Iu54qwM_iHmzpEPS_MBeZ8Xm4a64eio7bPurvrs67eQuLjloeq4KCRSusJ3l-UJjZvw0WXfmvg2G7w", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let self = self else { return }
            if let error = error {
                print("Ошибка: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Неверный ответ")
                return
            }
            
            if let data = data {
                do {
                    var decodedData = try JSONDecoder().decode([TaskEmployeeModel].self, from: data)
                    decodedData = decodedData.map { employee in
                        var employeeCopy = employee
                        if employeeCopy.selected == nil {
                            employeeCopy.selected = false
                        }
                        return employeeCopy
                    }
                    
                    decodedData.sort { $0.displayName ?? "" < $1.displayName ?? "" }
                    
                    DispatchQueue.main.async {
                        self.initiators = decodedData
                        self.selectedInitiators = self.initiators.filter { $0.selected == true }
                        self.unselectedInitiators = self.initiators.filter { $0.selected == false }
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print("Ошибка декодирования JSON: \(error)")
                }
            }
        }
        
        task.resume()
    }
}

class InitiatorCell: UITableViewCell {
    
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "unchekIcon")
        return view
    }()
    // UI Components
    private lazy var avatarImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.149, green: 0.157, blue: 0.259, alpha: 1)
        label.font = UIFont(name: "EuclidCircularB-Regular", size: 14)
        return label
    }()
    private lazy var positionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.426, green: 0.43, blue: 0.52, alpha: 1)
        label.font = UIFont(name: "EuclidCircularB-Regular", size: 12)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(positionLabel)
        
    }
    
    private func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
        }
        
        avatarImageView.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(32)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(16)
            make.bottom.equalTo(avatarImageView.snp.centerY).offset(-1)
        }
        
        positionLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.centerY).offset(1)
            make.leading.equalTo(nameLabel.snp.leading)
            make.trailing.equalTo(nameLabel.snp.trailing)
            make.bottom.equalToSuperview().offset(-10)
        }
        
    }
    
    func configure(with initiator: TaskEmployeeModel) {
        nameLabel.text = initiator.displayName
        positionLabel.text = initiator.department
        let avatarURL = URL(string: initiator.photoUrl ?? "defaultAvatar")
        avatarImageView.kf.setImage(with: avatarURL)
        if let isSelected = initiator.selected, isSelected {
            iconImageView.image = UIImage(named: "checkIcon")
        } else {
            iconImageView.image = UIImage(named: "unchekIcon")
        }
    }
}

