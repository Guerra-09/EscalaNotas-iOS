//
//  ProfileViewModel.swift
//  FirstApp
//
//  Created by José Guerra on 02-12-22.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var counter: Int = 0
    @Published var notasAgregadas = [String]()
    @Published var porcentajesAgregados = [String]()
    @Published var reducedSize: Bool = false
    
    @Published var materias: [Materia] = []
    
    init() {
        
        addRow(number: 4)
        
        materias.append(contentsOf: [Materia(name: "Programacion", notas: [6.1, 5.2, 4.8, 7.0], porcentajes: [35, 30, 20, 15], materiaColor: "blackBackground"), Materia(name: "Innovacion", notas: [5.0, 5.8, 5.8, 6.2], porcentajes: [15, 25, 30, 35], materiaColor: "yellowBackground")])
        counter = 2
    }
    
    
    
    func addMateria(materiaName: String, materiaColor: String) -> () {
        
        var notaAdd: [Float] = []
        var porcentajeAdd: [Int] = []
        
        for i in 0..<notasAgregadas.count {
            
            var notaBuena: Float = 0.0
            var porcentajeBueno: Int = 0
            
            if let nota = Float(notasAgregadas[i]) {
                notaBuena = nota / 10
            }
            
            if let porcentaje = Int(porcentajesAgregados[i]) {
                porcentajeBueno = porcentaje
            }
            
            notaAdd.append(notaBuena)
            porcentajeAdd.append(porcentajeBueno)
            
        }
        materias.append(Materia(name: materiaName, notas: notaAdd, porcentajes: porcentajeAdd, materiaColor: materiaColor))
    
    }
    
    func clearVariables() -> () {
        notasAgregadas.removeAll()
        porcentajesAgregados.removeAll()
        addRow(number: 4)
    }
    
    
    
    
    
    func addRow(number: Int) {
        
        counter += number
        
        for _ in 0..<number {
            notasAgregadas.append("")
            porcentajesAgregados.append("")
        }
        
    }
    
    
    func deleteRow() -> () {
        counter -= 1
        notasAgregadas.popLast()
        porcentajesAgregados.popLast()
        
    }
    
    
    
    
    func notasColor(color: String) -> Color {
        
        switch color {
            
        case "blueBackground":
            return .white
            
        case "yellowBackground":
            return .black
            
        case "blackBackground":
            return .white
            
        case "pinkBackground":
            return .white
            
       
        
            
            
        default:
            return .black
        }
    }
    
    
    
    
    
    
    
    func promedio(notas: [Float], porcentajes: [Int]) -> String {
        
        var sum: Float = 0.0
        
        for i in 0..<notas.count {
            
            var nota = notas[i]
            var porcentaje = porcentajes[i]
            
            sum += ((nota * Float(porcentaje)) / 100)
            
        }
        return "\(sum)"
    }
    
}
