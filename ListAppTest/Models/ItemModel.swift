//
//  ListItemModel.swift
//  ListAppTest
//
//  Created by Andrii Marchuk on 28.01.2025.
//

import Foundation


struct ItemModel: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func toggleDone(_ state: Bool) {
        isDone = state
    }
}
