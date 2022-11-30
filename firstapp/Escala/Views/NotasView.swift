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
            
            Text("Notas...")
            
            if isLoading {
                
                ProgressView()
                    .frame(width: 200, height: 200)
                    .scaleEffect(x: 2, y: 2)
                
            } else {
                
                ForEach(0...vm.puntajeMaximo, id: \.self) { puntaje in
                    //Text("\(puntaje) -> \( String(format: "%.1f", vm.getNota(puntos: Float(puntaje))) )")
                    
                    Text("\(puntaje) -> \( vm.getNota(puntos: Float(puntaje)))")
                }
                
            }
            
            
        }
        .onAppear {
                    
            DispatchQueue.main.asyncAfter(deadline: .now()+1.5, execute: {
                isLoading.toggle()
            })
            
            vm.setParameters(pMax: puntajeMaximo, nMaxima: notaMaxima, nMinima: notaMinima, nAprobacion: notaAprobacion, nExigencia: notaExigencia)
            
        }
    }
}

struct NotasView_Previews: PreviewProvider {
    static var previews: some View {
        NotasView(puntajeMaximo: "0", notaMaxima: "0", notaMinima: "0", notaAprobacion: "0", notaExigencia: "0")
    }
}
