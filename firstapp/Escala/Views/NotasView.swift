//
//  NotasView.swift
//  FirstApp
//
//  Created by José Guerra on 29-11-22.
//

import SwiftUI

struct NotasView: View {
    
    @StateObject private var vm = notaViewModel()
    
    @State var isLoading: Bool = true
    
    @State var puntajeMaximo: String
    @State var notaMaxima: String
    @State var notaMinima: String
    @State var notaAprobacion: String
    @State var notaExigencia: String
    
    var body: some View {
        
        
        ScrollView {
            
            Text("Notas")
                .font(.system(size: 40))
                .padding(.bottom, 60)
            
            if isLoading {
                
                ProgressView()
                    .frame(width: 200, height: 200)
                    .scaleEffect(x: 2, y: 2)
                
            } else {
                
                
                Grid {
                    GridRow(alignment: .top) {
                        VStack {
                            ForEach(0...vm.puntajeMaximo / 2, id: \.self) { puntaje in
                               
                                Text("\(puntaje) -> \(vm.getAverage(puntos: Float(puntaje)))")
                                    .modifier(NotaModifier(isRed: isBad(Nota: vm.getAverage(puntos: Float(puntaje)) )))
                                
                                    
                            }
                        }
                        
                        
                        VStack {
                            ForEach((vm.puntajeMaximo / 2)+1...vm.puntajeMaximo, id: \.self) { puntaje in
                               
                                Text("\(puntaje) -> \(vm.getAverage(puntos: Float(puntaje)))")
                                    .modifier(NotaModifier(isRed: isBad(Nota: vm.getAverage(puntos: Float(puntaje)) )))
                                    
                            }
                        }
                    }
                    
                }
                 
                
                
                
               
            }
        }
        
        .scrollIndicators(.hidden)
        .onAppear {
                    
            DispatchQueue.main.asyncAfter(deadline: .now()+1.5, execute: {
                isLoading.toggle()
            })
            
            vm.setParameters(pMax: puntajeMaximo, nMaxima: notaMaxima, nMinima: notaMinima, nAprobacion: notaAprobacion, nExigencia: notaExigencia)
        }
    }
    
    
    
    // Verifica que si el numero entregado esta por debajo de la nota de aprobacion
    func isBad(Nota data: String) -> Bool {
        
        var holdValue: Float = 0.0
        
        if let notaObtenida = Float(data) {
            holdValue = notaObtenida
        }
        
        if holdValue >= vm.notaAprobacion / 10 {
            return false
        }
        return true
    }
    
    
}

struct NotasView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NotasView(puntajeMaximo: "43", notaMaxima: "70", notaMinima: "10", notaAprobacion: "40", notaExigencia: "60")
        }
        
    }
}
