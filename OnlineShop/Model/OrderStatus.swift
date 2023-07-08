//
//  OrderStatus.swift
//  OnlineShop
//
//  Created by Rafael on 05/07/2023.
//

import Foundation

enum OrderStatus: String, CaseIterable {
    case new = "New"
    case progress = "In progress"
    case delivery = "Delivery"
    case completed = "Complited"
    case canceled = "Canceled"
}
