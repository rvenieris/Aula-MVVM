//
//  User.swift
//  AulaMVVM
//
//  Created by Victor Letichevsky on 12/10/22.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var name: String
    var password: String
    var height: Int
}
