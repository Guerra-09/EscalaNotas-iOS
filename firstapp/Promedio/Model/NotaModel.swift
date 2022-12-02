//
//  NotaModel.swift
//  FirstApp
//
//  Created by José Guerra on 30-11-22.
//

import Foundation

struct NotaModel: Identifiable {
    
    let id: String = UUID().uuidString
    var newNota: String
    let newPorcentaje: String
    
}
