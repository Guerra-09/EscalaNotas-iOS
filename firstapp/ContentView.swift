//
//  ContentView.swift
//  FirstApp
//
//  Created by José Guerra on 02-12-22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = notaViewModel()
    
    @State var puntajeMaximo: String
    @State var notaMaxima: String
    @State var notaMinima: String
    @State var notaAprobacion: String
    @State var notaExigencia: String
    
    @State var listing: [String] = [""]
    @State var listing2: [String] = [""]
    
    var body: some View {
        
        ScrollView {
            
                
            HStack {
                VStack {
                    ForEach(0...vm.puntajeMaximo / 2, id: \.self) { score in
                        
                            
                            Text("\(score)")
                    }
                }
                
                VStack {
                    ForEach(vm.puntajeMaximo / 2...vm.puntajeMaximo , id: \.self) { score in
                        
                            Text("\(score)")
                            .foregroundColor(.blue)
                    }
                }
            }
                
                
            
            
                
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
        .onAppear {
            vm.setParameters(pMax: puntajeMaximo, nMaxima: notaMaxima, nMinima: notaMinima, nAprobacion: notaAprobacion, nExigencia: notaExigencia)
            divisor(list: listing)
            
        }
        
        
    }
    
    func divisor(list: [String]) -> () {
        
        
        listing2 = ["e", "f", "g","h"]
        listing = ["a", "b", "c","d"]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(puntajeMaximo: "30", notaMaxima: "70", notaMinima: "10", notaAprobacion: "40", notaExigencia: "60")
    }
}
