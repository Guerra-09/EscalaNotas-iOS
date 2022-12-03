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
    let nroNotas: Int = 0
    let notas: [Float]
    let porcentajes: [Int]
    let materiaColor: String
    // Promedio: Se calculara siempre con los porcentajes...
}
