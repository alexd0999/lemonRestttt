//
//  MenuItem.swift
//  lemonRest
//
//  Created by Alex Arthur on 01 Nov 25
//

import Foundation

struct MenuItem: Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var price: Double
}
