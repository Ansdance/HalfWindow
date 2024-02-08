//
//  TaskEmployeeModel.swift
//  ModalStylesDemo
//
//  Created by ANSAR DAULETBAYEV on 07.02.2024.
//  Copyright © 2024 Russell Archer. All rights reserved.
//

import Foundation

public struct TaskEmployeeModel: Codable, Identifiable, Equatable, Hashable {
    public let id: String
    public var firstName: String?
    public var lastName: String?
    public var companyId: String?
    public var displayName: String?
    public var jobTitle: String?
    public var department: String?
    public var photoUrl: String?
    public var workEmail: String?
    public var selected: Bool? = false
    
    public init(id: String,
                firstName: String?,
                lastName: String?,
                companyId: String?,
                displayName: String?,
                jobTitle: String?,
                department: String?,
                photoUrl: String?,
                workEmail: String?,
                selected: Bool?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.companyId = companyId
        self.displayName = displayName
        self.jobTitle = jobTitle
        self.department = department
        self.photoUrl = photoUrl
        self.workEmail = workEmail
        self.selected = selected
    }
    
    public static func ==(lhs: TaskEmployeeModel, rhs: TaskEmployeeModel) -> Bool {
        return lhs.id == rhs.id &&
        lhs.lastName == rhs.lastName &&
        lhs.displayName == rhs.displayName &&
        lhs.jobTitle == rhs.jobTitle &&
        lhs.department == rhs.department &&
        lhs.photoUrl == rhs.photoUrl &&
        lhs.workEmail == rhs.workEmail &&
        lhs.selected == rhs.selected
    }
}

