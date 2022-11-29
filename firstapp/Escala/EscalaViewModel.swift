//
//  EscalaViewModel.swift
//  FirstApp
//
//  Created by José Guerra on 16-11-22.
//

import Foundation


class notaViewModel: ObservableObject {
    
    @Published var notasObtenidas: [NotasModel] = []
    
    @Published var puntajeMaximo: Int = 0
    @Published var notaAprobacion: Float = 0.0
    @Published var notaMaxima: Float = 0.0
    @Published var notaMinima: Float = 0.0
    @Published var exigencia: Int = 0
    

    
    
    func setVM(puntajeMaximo: Int, notaAprobacion: Float, notaMaxima: Float, notaMinima: Float, exigencia: Int) -> () {
        
        self.puntajeMaximo = puntajeMaximo
        self.notaAprobacion = notaAprobacion
        self.notaMaxima = notaMaxima
        self.notaMinima = notaMinima
        self.exigencia = exigencia
        
    }
    
    func setForEachNota() {
        
        
        
    }
    
    
    func getNota() -> [String] {
        
        var new: [String] = []
        
        for _ in 0...puntajeMaximo {
            
            new.append("Hola")
            
        }
        
        return new

    }
    
    
}
