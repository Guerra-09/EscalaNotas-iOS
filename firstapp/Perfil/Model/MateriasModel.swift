//
//  MateriasModel.swift
//  FirstApp
//
//  Created by José Guerra on 02-12-22.
//

import Foundation
import SwiftUI

struct Materia: Identifiable {
    
    let id = UUID().uuidString
    let name: String
    let notas: [Float]
    let porcentajes: [Int]
    let materiaColor: String
}
