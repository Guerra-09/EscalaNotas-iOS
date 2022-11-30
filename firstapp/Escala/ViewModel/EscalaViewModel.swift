//
//  EscalaViewModel.swift
//  FirstApp
//
//  Created by José Guerra on 16-11-22.
//

import Foundation


class notaViewModel: ObservableObject {
    
    @Published var notasObtenidas: [String] = []
    
    @Published var puntajeMaximo: Int = 0
    @Published var notaMaxima: Float = 0.0
    @Published var notaMinima: Float = 0.0
    @Published var notaAprobacion: Float = 0.0
    @Published var exigencia: Float = 0
    
    
    func setParameters(pMax: String, nMaxima: String, nMinima: String, nAprobacion: String, nExigencia: String) -> () {
        
        self.puntajeMaximo = Int(pMax) ?? 0
        self.notaMaxima = Float(nMaxima) ?? 0.0
        self.notaMinima = Float(nMinima) ?? 0.0
        self.notaAprobacion = Float(nAprobacion) ?? 0.0
        self.exigencia = Float(nExigencia) ?? 0.0
        
        self.exigencia = self.exigencia / 100
        
    }
    
    func getNota(puntos: Float) -> String {
        
        var puntajeAlto = (exigencia * Float(puntajeMaximo))
        
        if puntos < puntajeAlto {
            //return "formula 1"
            //(notaAprobacion - notaMinima) * (puntos / (exigencia * puntajeMaximo)) + notaMinima
            
            return "\((((notaAprobacion - notaMinima) * (puntos / (exigencia * Float(puntajeMaximo))) + notaMinima)) / 10)"
            

        } else if puntos >= puntajeAlto {
            
            return "\( (7-4) * (puntos - (exigencia * Float(puntajeMaximo)) ) / (Float(puntajeMaximo) * (1 - exigencia)) + 4 )"
            
            
        } else {
            return "Error"
        }
                
        

        
    }
    
    
}
