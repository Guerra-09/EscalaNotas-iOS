//
//  NotaViewModel.swift
//  FirstApp
//
//  Created by José Guerra on 30-11-22.
//

import Foundation
import SwiftUI


class NotaViewModel: ObservableObject {
    
    @Published var notas = [String]()
    @Published var porcentajes = [String]()
    
    @Published var counter = 0
    
    @Published var resultado: Double = 0.0
    
    // Esto en un futuro podria mostrar random frases. Tambien si esta por debajo de la nota de aprobacion pondra algo asi como, esfuerzate mas , si esta por encima te da las felicitaciones
    @Published var notaLog: [String] = []

    
    init() {
        
        notaLog.append("Ingresa las notas con enteros \nEj: 70 en vez de 7.0")
        
        addRow()
        addRow()
        addRow()
        addRow()
    }
    
    
    func mean2() -> () {
        
        
        
        var sum = 0.0
        var porcentajeSuma = 0.0
                
        for i in 0..<notas.count {
            
            var notaBuena: Double = 0.0
            var porcentajeBueno: Double = 0.0
            
            if let nota = Double(notas[i]) {
                notaBuena = nota
            }
        
            
            if let porcentaje = Double(porcentajes[i]) {
                porcentajeBueno = porcentaje
            }
            
            porcentajeSuma += porcentajeBueno
            
            sum += ((notaBuena * porcentajeBueno) / 100)
        }
        
        
        // Preparando el resultado...
        resultado = sum / 10
        
        notaLog.removeAll()
        
        if porcentajeSuma != 100 {
            notaLog.append("Cuidado, la suma de los porcentaje da \(porcentajeSuma)")
            // De momento esto solo seria valido en chile...
        } else if resultado < 4.0 {
            notaLog.append("Estas reprobando, estudia mas!")
            
        } else if (resultado > 4.0) && (resultado < 5.0) {
            notaLog.append("Apenas, pero estas pasando")
            
        } else if (resultado >= 5.1) {
            notaLog.append("Nada mal, te ira bien en la vida :)")
            
        } else {
            notaLog.append("Error")
        }
    }
    
    
    func addRow() {
        counter += 1
        notas.append("")
        porcentajes.append("")
    }
    
    
    func deleteRow() -> () {
        counter -= 1
        notas.popLast()
        porcentajes.popLast()
        
    }
    
    func thereIsLittle() -> Bool {
        
        if counter <= 2 {
            return true
        }
        return false
        
    }
    
    func thereIsMany() -> Bool {
        
        if counter >= 10 {
            return true
        }
        return false
    }
    
    
    
}
