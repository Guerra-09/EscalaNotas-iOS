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
    
    
    // Esta funcion se llama desde la vista y se actualizan los datos
    func setParameters(pMax: String, nMaxima: String, nMinima: String, nAprobacion: String, nExigencia: String) -> () {
        
        self.puntajeMaximo = Int(pMax) ?? 0
        self.notaMaxima = Float(nMaxima) ?? 0.0
        self.notaMinima = Float(nMinima) ?? 0.0
        self.notaAprobacion = Float(nAprobacion) ?? 0.0
        self.exigencia = Float(nExigencia) ?? 0.0
        
        self.exigencia = self.exigencia / 100
        
    }
    
    // Esta funcion retorna la nota obtenida
    func getAverage(puntos: Float) -> String {
        
        let puntajeAlto = (exigencia * Float(puntajeMaximo))
        
        
        // Verifica si es que el punto obtenido es MENOR al punto necesario para aprobar (4.0)
        if puntos < puntajeAlto {
            
            let resultado =  (((notaAprobacion - notaMinima) * (puntos / (exigencia * Float(puntajeMaximo))) + notaMinima)) / 10
            
            return "\(round(resultado*10) / 10)"
            
            
            
        // Verifica si es que el punto obtenido es MAYOR al punto necesario para aprobar (4.0)
        } else if puntos >= puntajeAlto {
            
            let calculo1 = (puntos - ((Float(exigencia * Float(puntajeMaximo)))))
            let calculo2 = (1 - exigencia) * Float(puntajeMaximo) + 0.000001
            
            let resultado = ( ((notaMaxima - notaAprobacion) / 10) * (calculo1 / calculo2) + (notaAprobacion / 10))
            
            return "\(round(resultado*10) / 10)"
            
            
        } else {
            
            return "Error"
        }
        
    }
    
}
