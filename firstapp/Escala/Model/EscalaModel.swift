//
//  EscalaModel.swift
//  FirstApp
//
//  Created by José Guerra on 16-11-22.
//

import Foundation

// This could be use in a future...

struct NotasModel: Identifiable {
    
    let id: String = UUID().uuidString
    let notaMaxima: Float
    let notaMinima: Float
    let notaAprobacion: Float
    let exigencia: Int
    let puntajeObtenido: Int

}
