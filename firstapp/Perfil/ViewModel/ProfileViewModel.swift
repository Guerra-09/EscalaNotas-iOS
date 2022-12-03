//
//  ProfileViewModel.swift
//  FirstApp
//
//  Created by José Guerra on 02-12-22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var counter: Int = 0
    @Published var notasAgregadas = [String]()
    @Published var porcentajesAgregados = [String]()
    
    @Published var materias: [Materia] = []
    
    init() {
        
        addRow(number: 4)
        
        
        materias.append(Materia(name: "Programacion", notas: [6.1, 5.2, 4.8, 7.0], porcentajes: [35, 35, 20, 15], materiaColor: "red"))
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
    
    
    
    
}
